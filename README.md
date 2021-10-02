# youbot-docker
-What do it do?
This repo presents a docker file with youbot configure to teleop "straight out of the box"
![youbot_teleop](https://github.com/DeepMechatronics/youbot-docker/blob/master/youbot_teleop.png)
## Prereq
[Install docker](https://docs.docker.com/engine/install/)

## How to use?
### Step 0 Give xhost right to root (needed to stream GUI on host computer)
```
xhost + local:root
```
### Step 1 Get docker image for repo

```
sudo docker pull ghcr.io/deepmechatronics/youbot-docker:latest
```

### Step 2 Run the docker image as docker container

```
sudo docker run -it --name=youbot  --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/dev:/dev"  --net=host --privileged youbot:latest
```

### Step 3 Get inside the docker container

open new tab

```
sudo docker exec -it youbot /bin/bash
```
### Step 4 Run the youbot simulator

```
roslaunch youbot_simulation simulator.launch
```

Enjoy the drive!
