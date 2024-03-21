#! /bin/bash

set -e
set -o nounset
set -o pipefail


[ -d $FW_TARGETDIR ] || mkdir $FW_TARGETDIR
pushd $FW_TARGETDIR >/dev/null

    vcs import --input $PREFIX/config/$RTOS/generic/uros_packages.repos

    # install uclibc
    # if [ ! -d "NuttX/libs/libxx/uClibc++" ]
    # then
    #   pushd uclibc >/dev/null
    #   ./install.sh ../NuttX
    #   popd >/dev/null
    # fi

    # ignore broken packages
    touch mcu_ws/ros2/rcl_logging/rcl_logging_spdlog/COLCON_IGNORE
    touch mcu_ws/ros2/rcl/COLCON_IGNORE
    touch mcu_ws/ros2/rosidl/rosidl_typesupport_introspection_cpp/COLCON_IGNORE
    touch mcu_ws/ros2/rcpputils/COLCON_IGNORE
    touch mcu_ws/ros2/ros2_tracing/test_tracetools/COLCON_IGNORE
    touch mcu_ws/uros/rcl/rcl_yaml_param_parser/COLCON_IGNORE
    touch mcu_ws/uros/rclc/rclc_examples/COLCON_IGNORE

popd >/dev/null
