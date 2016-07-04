# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "joint_states_listener: 0 messages, 1 services")

set(MSG_I_FLAGS "-Isensor_msgs:/opt/ros/hydro/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/hydro/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(joint_states_listener_generate_messages ALL)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(joint_states_listener
  "/home/pr2admin/desktop/tutorials/beginner/src/joint_states_listener/srv/ReturnJointStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/joint_states_listener
)

### Generating Module File
_generate_module_cpp(joint_states_listener
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/joint_states_listener
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(joint_states_listener_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(joint_states_listener_generate_messages joint_states_listener_generate_messages_cpp)

# target for backward compatibility
add_custom_target(joint_states_listener_gencpp)
add_dependencies(joint_states_listener_gencpp joint_states_listener_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS joint_states_listener_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(joint_states_listener
  "/home/pr2admin/desktop/tutorials/beginner/src/joint_states_listener/srv/ReturnJointStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/joint_states_listener
)

### Generating Module File
_generate_module_eus(joint_states_listener
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/joint_states_listener
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(joint_states_listener_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(joint_states_listener_generate_messages joint_states_listener_generate_messages_eus)

# target for backward compatibility
add_custom_target(joint_states_listener_geneus)
add_dependencies(joint_states_listener_geneus joint_states_listener_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS joint_states_listener_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(joint_states_listener
  "/home/pr2admin/desktop/tutorials/beginner/src/joint_states_listener/srv/ReturnJointStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/joint_states_listener
)

### Generating Module File
_generate_module_lisp(joint_states_listener
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/joint_states_listener
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(joint_states_listener_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(joint_states_listener_generate_messages joint_states_listener_generate_messages_lisp)

# target for backward compatibility
add_custom_target(joint_states_listener_genlisp)
add_dependencies(joint_states_listener_genlisp joint_states_listener_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS joint_states_listener_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(joint_states_listener
  "/home/pr2admin/desktop/tutorials/beginner/src/joint_states_listener/srv/ReturnJointStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/joint_states_listener
)

### Generating Module File
_generate_module_py(joint_states_listener
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/joint_states_listener
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(joint_states_listener_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(joint_states_listener_generate_messages joint_states_listener_generate_messages_py)

# target for backward compatibility
add_custom_target(joint_states_listener_genpy)
add_dependencies(joint_states_listener_genpy joint_states_listener_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS joint_states_listener_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/joint_states_listener)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/joint_states_listener
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(joint_states_listener_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/joint_states_listener)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/joint_states_listener
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(joint_states_listener_generate_messages_eus sensor_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/joint_states_listener)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/joint_states_listener
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(joint_states_listener_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/joint_states_listener)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/joint_states_listener\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/joint_states_listener
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(joint_states_listener_generate_messages_py sensor_msgs_generate_messages_py)
