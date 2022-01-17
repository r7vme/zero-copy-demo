#!/bin/bash
set -e

[ -d ws ] || git clone https://github.com/r7vme/ros2_shm_vision_demo.git ws/src/ros2_shm_vision_demo

source /opt/ros/rolling/setup.bash

cd ws
colcon build
cd -
