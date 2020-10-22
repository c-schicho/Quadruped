# Install script for directory: /home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jetson-nano/robot_open-quadruped/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_open_quadruped/msg" TYPE FILE FILES
    "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg"
    "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_open_quadruped/cmake" TYPE FILE FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/robot_open_quadruped-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/devel/include/robot_open_quadruped")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/devel/share/roseus/ros/robot_open_quadruped")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/devel/share/common-lisp/ros/robot_open_quadruped")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/devel/share/gennodejs/ros/robot_open_quadruped")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jetson-nano/robot_open-quadruped/catkin_ws/devel/lib/python3/dist-packages/robot_open_quadruped")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/devel/lib/python3/dist-packages/robot_open_quadruped")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/robot_open_quadruped.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_open_quadruped/cmake" TYPE FILE FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/robot_open_quadruped-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_open_quadruped/cmake" TYPE FILE FILES
    "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/robot_open_quadrupedConfig.cmake"
    "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/robot_open_quadrupedConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_open_quadruped" TYPE FILE FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_open_quadruped" TYPE PROGRAM FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/movement_control.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_open_quadruped" TYPE PROGRAM FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/transformation.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_open_quadruped" TYPE PROGRAM FILES "/home/jetson-nano/robot_open-quadruped/catkin_ws/build/robot_open_quadruped/catkin_generated/installspace/leg_movement.py")
endif()

