FROM osrf/ros:kinetic-desktop-full

# These values will be overrided by `docker run --env <key>=<value>` command
ENV ROS_IP 127.0.0.1
ENV ROS_MASTER_URI http://127.0.0.1:11311
RUN apt update

# Install some basic dependencies
RUN apt-get update && apt-get -y upgrade && apt-get -y install nano \
  curl ssh python-pip python3-pip ipython python-rospkg \
  && rm -rf /var/lib/apt/lists/*

RUN apt update 
RUN apt install -y python
# Set root password
RUN echo 'root:root' | chpasswd

# Permit SSH root login
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config


# Install catkin-tools
RUN apt-get update && apt-get install -y  ros-kinetic-catkin python-catkin-pkg python-catkin-pkg-modules python-catkin-tools \
  && rm -rf /var/lib/apt/lists/*


# Install additional packages
RUN apt-get update && apt-get -y upgrade && apt-get -y install git libcanberra-gtk-module libcanberra-gtk3-module\
  tmux \
  ros-kinetic-control-toolbox \
  ros-kinetic-geographic-msgs \
  ros-kinetic-controller-interface \
  ros-kinetic-ros-control ros-kinetic-joint-state-controller ros-kinetic-effort-controllers ros-kinetic-position-controllers ros-kinetic-teleop-twist-keyboard \
  ros-kinetic-velocity-controllers ros-kinetic-ros-controllers ros-kinetic-gazebo-ros ros-kinetic-gazebo-ros-control ros-kinetic-gazebo-ros-control \
  && rm -rf /var/lib/apt/lists/*


RUN git clone --recurse-submodules -q https://github.com/DeepMechatronics/youbot-docker.git catkin_ws

# Copy packages and build the workspace
WORKDIR /catkin_ws

RUN catkin config --extend /opt/ros/kinetic && catkin build --no-status

# Automatically source the workspace when starting a bash session
RUN echo "source /catkin_ws/devel/setup.bash" >> /etc/bash.bashrc
# Install start script

COPY ./start.sh /
CMD ["/start.sh"]
