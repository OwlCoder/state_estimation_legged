# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build

# Include any dependencies generated for this target.
include CMakeFiles/input_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/input_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/input_test.dir/flags.make

CMakeFiles/input_test.dir/src/input_test.cpp.o: CMakeFiles/input_test.dir/flags.make
CMakeFiles/input_test.dir/src/input_test.cpp.o: ../src/input_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/input_test.dir/src/input_test.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/input_test.dir/src/input_test.cpp.o -c /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/input_test.cpp

CMakeFiles/input_test.dir/src/input_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/input_test.dir/src/input_test.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/input_test.cpp > CMakeFiles/input_test.dir/src/input_test.cpp.i

CMakeFiles/input_test.dir/src/input_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/input_test.dir/src/input_test.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/input_test.cpp -o CMakeFiles/input_test.dir/src/input_test.cpp.s

CMakeFiles/input_test.dir/src/input_test.cpp.o.requires:

.PHONY : CMakeFiles/input_test.dir/src/input_test.cpp.o.requires

CMakeFiles/input_test.dir/src/input_test.cpp.o.provides: CMakeFiles/input_test.dir/src/input_test.cpp.o.requires
	$(MAKE) -f CMakeFiles/input_test.dir/build.make CMakeFiles/input_test.dir/src/input_test.cpp.o.provides.build
.PHONY : CMakeFiles/input_test.dir/src/input_test.cpp.o.provides

CMakeFiles/input_test.dir/src/input_test.cpp.o.provides.build: CMakeFiles/input_test.dir/src/input_test.cpp.o


CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o: CMakeFiles/input_test.dir/flags.make
CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o: ../src/input/input_manager_mobile_io.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o -c /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/input/input_manager_mobile_io.cpp

CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/input/input_manager_mobile_io.cpp > CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.i

CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/input/input_manager_mobile_io.cpp -o CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.s

CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.requires:

.PHONY : CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.requires

CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.provides: CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.requires
	$(MAKE) -f CMakeFiles/input_test.dir/build.make CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.provides.build
.PHONY : CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.provides

CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.provides.build: CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o


CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o: CMakeFiles/input_test.dir/flags.make
CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o: ../src/xml_util/pugixml.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o -c /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/xml_util/pugixml.cpp

CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/xml_util/pugixml.cpp > CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.i

CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/xml_util/pugixml.cpp -o CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.s

CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.requires:

.PHONY : CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.requires

CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.provides: CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.requires
	$(MAKE) -f CMakeFiles/input_test.dir/build.make CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.provides.build
.PHONY : CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.provides

CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.provides.build: CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o


CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o: CMakeFiles/input_test.dir/flags.make
CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o: ../src/xml_util/xml_helpers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o -c /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/xml_util/xml_helpers.cpp

CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/xml_util/xml_helpers.cpp > CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.i

CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/src/xml_util/xml_helpers.cpp -o CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.s

CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.requires:

.PHONY : CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.requires

CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.provides: CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.requires
	$(MAKE) -f CMakeFiles/input_test.dir/build.make CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.provides.build
.PHONY : CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.provides

CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.provides.build: CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o


CMakeFiles/input_test.dir/input_test_automoc.cpp.o: CMakeFiles/input_test.dir/flags.make
CMakeFiles/input_test.dir/input_test_automoc.cpp.o: input_test_automoc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/input_test.dir/input_test_automoc.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/input_test.dir/input_test_automoc.cpp.o -c /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/input_test_automoc.cpp

CMakeFiles/input_test.dir/input_test_automoc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/input_test.dir/input_test_automoc.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/input_test_automoc.cpp > CMakeFiles/input_test.dir/input_test_automoc.cpp.i

CMakeFiles/input_test.dir/input_test_automoc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/input_test.dir/input_test_automoc.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/input_test_automoc.cpp -o CMakeFiles/input_test.dir/input_test_automoc.cpp.s

CMakeFiles/input_test.dir/input_test_automoc.cpp.o.requires:

.PHONY : CMakeFiles/input_test.dir/input_test_automoc.cpp.o.requires

CMakeFiles/input_test.dir/input_test_automoc.cpp.o.provides: CMakeFiles/input_test.dir/input_test_automoc.cpp.o.requires
	$(MAKE) -f CMakeFiles/input_test.dir/build.make CMakeFiles/input_test.dir/input_test_automoc.cpp.o.provides.build
.PHONY : CMakeFiles/input_test.dir/input_test_automoc.cpp.o.provides

CMakeFiles/input_test.dir/input_test_automoc.cpp.o.provides.build: CMakeFiles/input_test.dir/input_test_automoc.cpp.o


# Object files for target input_test
input_test_OBJECTS = \
"CMakeFiles/input_test.dir/src/input_test.cpp.o" \
"CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o" \
"CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o" \
"CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o" \
"CMakeFiles/input_test.dir/input_test_automoc.cpp.o"

# External object files for target input_test
input_test_EXTERNAL_OBJECTS =

input_test: CMakeFiles/input_test.dir/src/input_test.cpp.o
input_test: CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o
input_test: CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o
input_test: CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o
input_test: CMakeFiles/input_test.dir/input_test_automoc.cpp.o
input_test: CMakeFiles/input_test.dir/build.make
input_test: hebi-cpp-/libhebic++.so.2.0.1
input_test: /home/namang/cpp_ws/src/hebi-cpp-examples/hebi-cpp/hebi/lib/linux_x86_64/libhebi.so
input_test: CMakeFiles/input_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable input_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/input_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/input_test.dir/build: input_test

.PHONY : CMakeFiles/input_test.dir/build

CMakeFiles/input_test.dir/requires: CMakeFiles/input_test.dir/src/input_test.cpp.o.requires
CMakeFiles/input_test.dir/requires: CMakeFiles/input_test.dir/src/input/input_manager_mobile_io.cpp.o.requires
CMakeFiles/input_test.dir/requires: CMakeFiles/input_test.dir/src/xml_util/pugixml.cpp.o.requires
CMakeFiles/input_test.dir/requires: CMakeFiles/input_test.dir/src/xml_util/xml_helpers.cpp.o.requires
CMakeFiles/input_test.dir/requires: CMakeFiles/input_test.dir/input_test_automoc.cpp.o.requires

.PHONY : CMakeFiles/input_test.dir/requires

CMakeFiles/input_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/input_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/input_test.dir/clean

CMakeFiles/input_test.dir/depend:
	cd /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build /home/namang/cpp_ws/src/hebi-cpp-examples/kits/daisy_naman/build/CMakeFiles/input_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/input_test.dir/depend

