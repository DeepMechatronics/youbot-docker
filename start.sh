#!/bin/bash -i
git pull
rosrun xacro xacro --inorder -o /catkin_ws/src/youbot_description/robots/youbot.urdf /catkin_ws/src/youbot_description/robots/youbot.urdf.xacro

echo "============Please open new tab and start docker container there==========="
catkin build
source devel/setup.bash
roslaunch gazebo_ros empty_world.launch
rosrun core spin.py


