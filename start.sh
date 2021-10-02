#!/bin/bash -i
git pull

echo "============Please open new tab and start docker container there==========="
catkin build
source devel/setup.bash
rosrun core spin.py


