# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_open_quadruped: 2 messages, 0 services")

set(MSG_I_FLAGS "-Irobot_open_quadruped:/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_open_quadruped_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" NAME_WE)
add_custom_target(_robot_open_quadruped_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_open_quadruped" "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" ""
)

get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" NAME_WE)
add_custom_target(_robot_open_quadruped_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_open_quadruped" "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_open_quadruped
)
_generate_msg_cpp(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_open_quadruped
)

### Generating Services

### Generating Module File
_generate_module_cpp(robot_open_quadruped
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_open_quadruped
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_open_quadruped_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_open_quadruped_generate_messages robot_open_quadruped_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_cpp _robot_open_quadruped_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_cpp _robot_open_quadruped_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_open_quadruped_gencpp)
add_dependencies(robot_open_quadruped_gencpp robot_open_quadruped_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_open_quadruped_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_open_quadruped
)
_generate_msg_eus(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_open_quadruped
)

### Generating Services

### Generating Module File
_generate_module_eus(robot_open_quadruped
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_open_quadruped
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_open_quadruped_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_open_quadruped_generate_messages robot_open_quadruped_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_eus _robot_open_quadruped_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_eus _robot_open_quadruped_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_open_quadruped_geneus)
add_dependencies(robot_open_quadruped_geneus robot_open_quadruped_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_open_quadruped_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_open_quadruped
)
_generate_msg_lisp(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_open_quadruped
)

### Generating Services

### Generating Module File
_generate_module_lisp(robot_open_quadruped
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_open_quadruped
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_open_quadruped_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_open_quadruped_generate_messages robot_open_quadruped_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_lisp _robot_open_quadruped_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_lisp _robot_open_quadruped_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_open_quadruped_genlisp)
add_dependencies(robot_open_quadruped_genlisp robot_open_quadruped_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_open_quadruped_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_open_quadruped
)
_generate_msg_nodejs(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_open_quadruped
)

### Generating Services

### Generating Module File
_generate_module_nodejs(robot_open_quadruped
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_open_quadruped
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_open_quadruped_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_open_quadruped_generate_messages robot_open_quadruped_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_nodejs _robot_open_quadruped_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_nodejs _robot_open_quadruped_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_open_quadruped_gennodejs)
add_dependencies(robot_open_quadruped_gennodejs robot_open_quadruped_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_open_quadruped_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_open_quadruped
)
_generate_msg_py(robot_open_quadruped
  "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_open_quadruped
)

### Generating Services

### Generating Module File
_generate_module_py(robot_open_quadruped
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_open_quadruped
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_open_quadruped_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_open_quadruped_generate_messages robot_open_quadruped_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/JointAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_py _robot_open_quadruped_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson-nano/robot_open-quadruped/catkin_ws/src/robot_open_quadruped/msg/TransformedAngles.msg" NAME_WE)
add_dependencies(robot_open_quadruped_generate_messages_py _robot_open_quadruped_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_open_quadruped_genpy)
add_dependencies(robot_open_quadruped_genpy robot_open_quadruped_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_open_quadruped_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_open_quadruped)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_open_quadruped
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robot_open_quadruped_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_open_quadruped)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_open_quadruped
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robot_open_quadruped_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_open_quadruped)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_open_quadruped
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robot_open_quadruped_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_open_quadruped)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_open_quadruped
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robot_open_quadruped_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_open_quadruped)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_open_quadruped\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_open_quadruped
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robot_open_quadruped_generate_messages_py std_msgs_generate_messages_py)
endif()
