docker pull nvcr.io/nvidia/l4t-ml:r32.6.1-py3
docker build . -t jetson_teamc
xhost +
docker run -it -e DISPLAY=$DISPLAY --gpus all --rm --device /dev/video0 -v $PWD/jetson_team_c:/location/in/container -v /tmp/.X11-unix:/tmp/.X11-unix jetson_teamc
