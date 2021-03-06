#include "EKF.hpp"
#include "est_utils.hpp"
#include <cmath>

using namespace Eigen;
using namespace std;

EKF::EKF()
{
    bias_recorded=false;
    acc_bias_list.resize(0);
    gyro_bias_list.resize(0);
    curr_state.fill(0);
    grav_vec.fill(0);
    grav_vec(2)=9.8;
    setSensorsNoise();
}

// @return false if all zeros
bool EKF::estimator_init()
{
    return !curr_state.isZero(0);
}

//TO DO: in future use orientation of the feet too if that makes sense
bool EKF::updateCurrState(const std::vector<Matrix4d>& feet_pose_vec)
{
    curr_state.fill(0);
    curr_state.segment<6>(0)<<0,0,0,0,0,0;
    curr_state.segment<4>(6)<<1,0,0,0;
    curr_state.segment<18>(10)<<feet_pose_vec[0].topRightCorner(3,1),
                                feet_pose_vec[1].topRightCorner(3,1),
                                feet_pose_vec[2].topRightCorner(3,1),
                                feet_pose_vec[3].topRightCorner(3,1),
                                feet_pose_vec[4].topRightCorner(3,1),
                                feet_pose_vec[5].topRightCorner(3,1);
                                
    curr_state.segment<3>(28)<<acc_bias_list[0],acc_bias_list[0],acc_bias_list[0];
    curr_state.segment<3>(31)<<gyro_bias_list[0],gyro_bias_list[0],gyro_bias_list[0];

    return true;
}

bool EKF::predict(const Vector3d& av_acc,const Vector3d& av_angvel)
{
    dt=fbk_dt.count();
    //to make code readable
    VectorXd updated_r=curr_state.segment<3>(0);
    VectorXd updated_v=curr_state.segment<3>(3);
    VectorXd updated_q_vec=curr_state.segment<4>(6);
    Quaterniond updated_q(updated_q_vec[0],updated_q_vec[1],updated_q_vec[2],updated_q_vec[3]);
    Matrix3d updated_rotm=utils::quat2rotm(updated_q);
    VectorXd updated_p=curr_state.segment<18>(10);
    Vector3d updated_bacc=curr_state.segment<3>(28);
    Vector3d updated_bgyro=curr_state.segment<3>(31);
    
    //equation 36 and 37
    Vector3d corrected_acc=av_acc-updated_bacc;
    Vector3d corrected_gyro=av_angvel-updated_bgyro;

    //equation 30-35
    curr_state.segment<3>(0)=updated_r+dt*(updated_v)+pow(dt,2)/2*(updated_rotm.transpose()*corrected_acc+grav_vec);
    curr_state.segment<3>(3)=updated_v+dt*(updated_rotm.transpose()*corrected_acc+grav_vec);
    Quaterniond predicted_q=utils::quatMult(utils::axang2quat(dt*corrected_gyro),updated_q);
    curr_state.segment<4>(6)<<predicted_q.w(),predicted_q.x(),predicted_q.y(),predicted_q.z();
    //rest remain same

    //set F
    setLinearizedProcessDynamics(updated_rotm,corrected_acc,corrected_gyro); 
    //set Q
    setProcessNoise(updated_rotm,corrected_acc,corrected_gyro);
    
    //set State Covariance
    curr_cov=((F*curr_cov)*F.transpose())+Q;

    return true;

}

bool EKF::update(const std::vector<Matrix4d>& feet_pose_vec, const std::vector<Eigen::MatrixXd>& jac_vec)
{
    VectorXd pred_r=curr_state.segment<3>(0);
    VectorXd pred_q_vec=curr_state.segment<4>(6);
    Quaterniond pred_q(pred_q_vec[0],pred_q_vec[1],pred_q_vec[2],pred_q_vec[3]);
    Matrix3d pred_rotm=utils::quat2rotm(pred_q);
    VectorXd pred_p=curr_state.segment<18>(10);

    VectorXd y_residual=getMeasurementResidual(feet_pose_vec, pred_rotm, pred_r, pred_p);
    //18x33
    setLinearizedMeasureDynamics(pred_rotm, pred_r, pred_p);
    //18x18
    setMeasureNoise(jac_vec);
    //18x18
    MatrixXd S=H*curr_cov*H.transpose()+R;
    //33x18
    MatrixXd K=curr_cov*H.transpose()*S.inverse();
    //33x1
    VectorXd delta_x=K*y_residual;
    curr_cov=(MatrixXd::Identity(state_dim-1,state_dim-1)-K*H)*curr_cov;

    //add delta_x back to curr_state
    curr_state.segment<6>(0)=curr_state.segment<6>(0)+delta_x.segment<6>(0);
    curr_state.segment<18>(10)=curr_state.segment<18>(10)+delta_x.segment<18>(9);
    curr_state.segment<6>(28)=curr_state.segment<6>(28)+delta_x.segment<6>(27);
    Quaterniond delta_q=utils::axang2quat(delta_x.segment<3>(6));
    Quaterniond upd_q=utils::quatMult(delta_q,pred_q);
    curr_state.segment<4>(6)<<upd_q.w(),upd_q.x(),upd_q.y(),upd_q.z();
}

void EKF::filtering(const Vector3d& av_acc, const Vector3d& av_angvel,
                        const std::vector<Matrix4d>& feet_pose_vec, const std::vector<Eigen::MatrixXd>& jac_vec )
{
    predict(av_acc, av_angvel);
}

void EKF::setSensorsNoise()
{
    Matrix3d I;
    I.setIdentity(3,3);
    noise_params.acc=0.01*I;
    noise_params.bias_acc=0.001*I;
    noise_params.gyro=0.01*I;
    noise_params.bias_gyro=0.001*I;
    noise_params.feet=0.01*I;
    noise_params.fk=0.01*I;
    noise_params.encoders=0.01;
}

void EKF::setLinearizedProcessDynamics(const Matrix3d& updated_rotm, const Vector3d& corrected_acc, const Vector3d& corrected_gyro)
{
    //TO DO: Is there a better way to hard code an entire matrix?
    Matrix3d I;
    I.setIdentity(3,3);
    F.setIdentity(state_dim-1,state_dim-1);
    F.block<3,3>(0,3)=dt*I;
    F.block<3,3>(0,6)=-(pow(dt,2)/2)*(updated_rotm.transpose())*utils::vec2skewsym(corrected_acc);
    F.block<3,3>(0,27)=-(pow(dt,2)/2)*(updated_rotm.transpose());
    F.block<3,3>(3,6)=-dt*updated_rotm.transpose()*utils::vec2skewsym(corrected_acc);
    F.block<3,3>(3,27)=-dt*updated_rotm.transpose();
    F.block<3,3>(6,6)=utils::rodrigues(corrected_gyro,0).transpose();
    F.block<3,3>(6,30)=-1*utils::rodrigues(corrected_gyro,1).transpose();
}

void EKF::setLinearizedMeasureDynamics(const Matrix3d& pred_rotm,const VectorXd& pred_r, const VectorXd& pred_p)
{
    //TO DO: Is there a better way to hard code an entire matrix?
    H.fill(0);
    H.block<18,3>(0,0)=pred_rotm.replicate(6,1);
    H.block<3,3>(0,6)=utils::vec2skewsym(pred_rotm*(pred_p.segment<3>(0)-pred_r));
    H.block<3,3>(3,6)=utils::vec2skewsym(pred_rotm*(pred_p.segment<3>(3)-pred_r));
    H.block<3,3>(6,6)=utils::vec2skewsym(pred_rotm*(pred_p.segment<3>(6)-pred_r));
    H.block<3,3>(9,6)=utils::vec2skewsym(pred_rotm*(pred_p.segment<3>(9)-pred_r));
    H.block<3,3>(12,6)=utils::vec2skewsym(pred_rotm*(pred_p.segment<3>(12)-pred_r));
    H.block<3,3>(15,6)=utils::vec2skewsym(pred_rotm*(pred_p.segment<3>(15)-pred_r));
    //TO DO: use Kron product when it is supported in Eigen
    H.block<3,3>(0,9)=pred_rotm;
    H.block<3,3>(3,12)=pred_rotm;
    H.block<3,3>(6,15)=pred_rotm;
    H.block<3,3>(9,18)=pred_rotm;
    H.block<3,3>(12,21)=pred_rotm;
    H.block<3,3>(15,24)=pred_rotm;
}

void EKF::setProcessNoise(const Matrix3d& updated_rotm,const Vector3d& corrected_acc,const Vector3d& corrected_gyro)
{
    //TO DO: Is there a better way to hard code an entire matrix?
    Q.fill(0);
    Q.block<3,3>(0,0)=(pow(dt,3)/3)*noise_params.acc+(pow(dt,5)/20)*noise_params.bias_acc;
    Q.block<3,3>(0,3)=(pow(dt,2)/2)*noise_params.acc+(pow(dt,4)/8)*noise_params.bias_acc;
    Q.block<3,3>(0,27)=-1*(pow(dt,3)/6)*updated_rotm.transpose()*noise_params.bias_acc;
    Q.block<3,3>(3,0)=(pow(dt,2)/2)*noise_params.acc+(pow(dt,4)/8)*noise_params.bias_acc;
    Q.block<3,3>(3,3)=dt*noise_params.acc+(pow(dt,3)/3)*noise_params.bias_acc;
    Q.block<3,3>(3,27)=-1*(pow(dt,2)/2)*updated_rotm.transpose()*noise_params.bias_acc;
    Q.block<3,3>(6,6)=dt*noise_params.gyro+
                        (utils::rodrigues(corrected_gyro,3)+utils::rodrigues(corrected_gyro,3).transpose())*noise_params.bias_gyro;
    Q.block<3,3>(9,9)= dt*updated_rotm.transpose()*noise_params.feet*updated_rotm;
    Q.block<3,3>(12,12)=dt*updated_rotm.transpose()*noise_params.feet*updated_rotm;
    Q.block<3,3>(15,15)=dt*updated_rotm.transpose()*noise_params.feet*updated_rotm;
    Q.block<3,3>(18,18)=dt*updated_rotm.transpose()*noise_params.feet*updated_rotm;
    Q.block<3,3>(21,21)=dt*updated_rotm.transpose()*noise_params.feet*updated_rotm;
    Q.block<3,3>(24,24)=dt*updated_rotm.transpose()*noise_params.feet*updated_rotm;
    Q.block<3,3>(27,0)=-1*(pow(dt,3)/6)*noise_params.bias_acc*updated_rotm;
    Q.block<3,3>(27,3)=-1*(pow(dt,2)/2)*noise_params.bias_acc*updated_rotm;
    Q.block<3,3>(27,27)= dt*noise_params.bias_acc;
    Q.block<3,3>(30,6)=-1*noise_params.bias_gyro*(utils::rodrigues(corrected_gyro,2));
    Q.block<3,3>(30,30)= dt*noise_params.bias_gyro;   
}

void EKF::setMeasureNoise(const std::vector<Eigen::MatrixXd>& jac_vec)
{
    R.setIdentity(18,18);
    R.block<3,3>(0,0)=noise_params.fk+jac_vec[0]*noise_params.encoders*jac_vec[0].transpose();
    R.block<3,3>(3,3)=noise_params.fk+jac_vec[1]*noise_params.encoders*jac_vec[1].transpose();
    R.block<3,3>(6,6)=noise_params.fk+jac_vec[2]*noise_params.encoders*jac_vec[2].transpose();
    R.block<3,3>(9,9)=noise_params.fk+jac_vec[3]*noise_params.encoders*jac_vec[3].transpose();
    R.block<3,3>(12,12)=noise_params.fk+jac_vec[4]*noise_params.encoders*jac_vec[4].transpose();
    R.block<3,3>(15,15)=noise_params.fk+jac_vec[5]*noise_params.encoders*jac_vec[5].transpose();
    
}

VectorXd EKF::getMeasurementResidual(const std::vector<Matrix4d>& feet_pose_vec,
                                        const Matrix3d& pred_rotm,const VectorXd& pred_r,const VectorXd& pred_p )
{
    VectorXd y;
    Vector3d y1=feet_pose_vec[0].topRightCorner(3,1)-(pred_rotm*(pred_p.segment<3>(0)-pred_r));
    Vector3d y2=feet_pose_vec[1].topRightCorner(3,1)-(pred_rotm*(pred_p.segment<3>(3)-pred_r));
    Vector3d y3=feet_pose_vec[2].topRightCorner(3,1)-(pred_rotm*(pred_p.segment<3>(6)-pred_r));
    Vector3d y4=feet_pose_vec[3].topRightCorner(3,1)-(pred_rotm*(pred_p.segment<3>(9)-pred_r));
    Vector3d y5=feet_pose_vec[4].topRightCorner(3,1)-(pred_rotm*(pred_p.segment<3>(12)-pred_r));
    Vector3d y6=feet_pose_vec[5].topRightCorner(3,1)-(pred_rotm*(pred_p.segment<3>(15)-pred_r));
    y<<y1,y2,y3,y4,y5,y6;
    return y;
}