# Detection_of_Street_Smokers

Smoker detection application with [YOLOv5](https://github.com/ultralytics/yolov5) on [Jetson Nano](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/)  

![github](https://user-images.githubusercontent.com/64348058/138314179-14dfeb87-90bd-4731-a1b8-b4e709240762.gif)

## Table of context
- [About the project](https://github.com/HaseU-git/Detection_of_Street_Smokers#about-the-project)
	- [Background](https://github.com/HaseU-git/Detection_of_Street_Smokers#background)
	- [What this application do](https://github.com/HaseU-git/Detection_of_Street_Smokers#what-this-application-do)
	- [Why Jetson Nano and YOLOv5](https://github.com/HaseU-git/Detection_of_Street_Smokers#why-jetson-nano-and-yolov5)
	- [Built With](https://github.com/HaseU-git/Detection_of_Street_Smokers#built-with)
- [Getting Started](https://github.com/HaseU-git/Detection_of_Street_Smokers#getting-started)
	- [Prerequisites](https://github.com/HaseU-git/Detection_of_Street_Smokers#prerequisites)
	- [Installation](https://github.com/HaseU-git/Detection_of_Street_Smokers#installation)
- [Usage](https://github.com/HaseU-git/Detection_of_Street_Smokers#usage)
	- [Detect Only](https://github.com/HaseU-git/Detection_of_Street_Smokers#detect-only)
	- [Detect and Notify](https://github.com/HaseU-git/Detection_of_Street_Smokers#detect-and-notify)

## About The Project

### Background

It is clear that smoking poses health and environmental problems. Particularly in recent years, with the decrease in the number of smoking areas, there are concerns about littering and passive smoking. However, it is difficult to constantly monitor smoking and call attention on the streets.  
Our project sends a notification when it detects smokers, so it can efficiently prevent smoking on the streets.

### What this application do

This project using the Jetson Nano detects in areas where smoking is prohibited. Detection is conducted by YOLOv5s model.  
When a smoker is detected, notifications can be sent to various services and applications such as Slack, LINE, IFTTT, etc. to inform the administrator of the abnormality.

### Why Jetson Nano and YOLOv5
We wonder if NVIDIA Jetson Nano can detect specific object in real-time by using YOLOv5 because we couldn't find any real-time detection project using YOLOv5. The use of edge AI is expanding. We thought more problems will be solved if it works well.

### Built With
- NVIDIA Docker: 2.0.3 Engine: 20.10.7
- YOLOv5 by ultralytics

We are assuming that this application is used on NVIDIA Jetson Nano so it might not work well if you do not use this device. Our project runs Docker container to prevent this kind of situation  but we cannot assure that no errors will occur.  

## Getting Started

Let's clone this repository into your NVIDIA Jetson Nano.

```shell
$ https://github.com/HaseU-git/Detection_of_Street_Smokers
```

Next, follow the documents below.

### Prerequisites

Before run this application, there are some requirements so please check them.


#### Docker

We use NVIDIA-Docker to start this project so you have to check that appropriate Docker is installed in your device. If your device do, you can start docker using following code.

Check version
```
$ nvidia-docker version
```

<img width="1280" alt="スクショ 2021-10-22 at 1 13 39" src="https://user-images.githubusercontent.com/64348058/138316774-e4e49eba-629a-4cdd-b12f-5fe580aff62f.png">


Check Docker daemon status

```
$ service docker status
```

Start Docker deamon
```
$ service docker start
```

<hr>

#### Camera

We use [this USB Camera](https://www.logitech.com/en-us/products/webcams/c270-hd-webcam.960-000694.html) for detection.    

![IMG_1982](https://user-images.githubusercontent.com/64348058/138317139-1d07e838-c0c1-4c4b-90b0-82db435f16dc.JPG)


If you use CSI Camara or other cameras you might have to rewrite our source code. (For example `-v` option of `docker run` command in `run_docker.sh`)  

Please check if your camera is connected before run Docer container.


Check connection of cameras
```
$ ls /dev/video*
```

If the display show `/dev/video0`, your camera is connected.

<hr>

#### Webhook

If you want to accept the message when the device find the specific class (in this case when smoker is deteced), it is necessary to do the setting by following instruction.  

There are four template files for each webhook services (LINE, IFTTT, Discord and Slack). Following instruction is written in order to accept the detection message in Slack.  

##### Slack

Please sign up and log in Slack before settinng of the webhook. And you need to create workspace if you don't have any workspaces. 

If you done, you can click [here](https://slack.com/services/new/incoming-webhook). 

<img width="1680" alt="スクショ 2021-10-21 at 22 44 14" src="https://user-images.githubusercontent.com/64348058/138317364-f61b6604-ab94-46f3-92a3-ef8692d33b9a.png">

Then you can see this kind web page. You can choose workspaces by upper right pull down button and you can choose channels by center pull down button. Press `Add Incoming WebHooks integration` button and you can see following web page. 

<img width="1680" alt="スクショ 2021-10-21 at 22 44 54" src="https://user-images.githubusercontent.com/64348058/138317659-9d5a02c9-25a7-411c-af48-1bb002218b15.png">

`Webhook URL` shows your url so please copy this link.  
Open `wbhk.py` (it is in `ssdetector` directory) in text editor and paste webhook url into `YOUR_WEBHOOK_URL`.  

<img width="1680" alt="スクショ 2021-10-21 at 23 00 41" src="https://user-images.githubusercontent.com/64348058/138317923-29d8777b-57f0-4e45-9ede-2a0f755b76e7.png">

If you done these steps, you can receive the message in Slack when device detect smoker.

<hr>

##### Others(Discord, IFTTT, LINE)

If you want to use other webhook services such as IFTTT, our repository has template files so you can use these files. 
(In case of IFTTT: `wbhk_ifttt.py`, In case of Discord: `wbhk_discord.py`, In case of LINE: `wbhk_line.py`)  

You can copy the webhook URL in the similar way as Slack. But you have to change one more thing.  
Open `ssdetector.py` file.  You can find following code in the sixth line.  

```python
from wbhk import webhook_request
```

Replace `wbhk` with other wbhk file name. For example, rewrite as folloing code if you want to use IFTTT.

```python
from wbhk_ifttt import webhook_request
```

Then you can receive the message from any services.

<hr>

#### Internet

The internet environment is reqired to clone YOLOv5 repositorry. We reccomend attaching wi-fi adoptor to connect the Internet.
This is the [wi-fi adoptor](https://www.elecom.co.jp/products/WDC-150SU2MBK.html) that I use.

![IMG_1986](https://user-images.githubusercontent.com/64348058/138318220-7c02fa7f-8ea0-403b-8625-e15e2e4fe429.jpg)

You can check your network environment using folloing command.  

```
$ ifconfig
```
<hr>

### Installation

You can install our project by doing following steps.

1. Clone YOLOv5 and integrate our source code
2. Build the docker image and run the docker container  

#### YOLOv5

First, you have to clone YOLOv5 and integrate our code. We prepare shell scrip to do this. Please command following code.

```shell
$ sudo chmod 744 integrate_yolov5.sh
$ ./integrate_yolov5.sh
```

<hr>

#### Docker

Second, pull Docker image and build Docker image. Then run the docker container.

```shell
$ sudo docker pull nvcr.io/nvidia/l4t-ml:r32.6.1-py3
$ sudo docker build . -t jetson_keio_teamc
$ sudo docker run -it -e DISPLAY=$DISPLAY --gpus all --device /dev/video0 -v $PWD/volume_dir:/location/in/container -v /tmp/.X11-unix:/tmp/.X11-unix jetson_keio_teamc

```
It takes several minutes unil finish this process. Wait patiently :)
Finally, you loged in Docker container.

<hr>

## Usage

Let's detect!!

### Detect Only

If you do not want to receive any messages, please command following code (It takes several minutes).

```shell
$ cd /location/in/container/yolov5
$ python3 detect_only.py --source 0 --weights weight.pt
```

This code is default detection code YOLOv5 so please visit [this page](https://github.com/ultralytics/yolov5) if you want to know more detail.

<hr>

### Detect and Notify

If you want receive the message from device when specific class is detected, please command following code (It takes several minutes)
. 
```shell
$ cd /location/in/container/yolov5
$ python3 ssdetector.py --source 0 --interval 60
```

![moeko_long_2021-08-15_3](https://user-images.githubusercontent.com/64348058/138320243-76bdd6e3-5058-47c0-b9e7-4bd5e853b1c6.gif)


You can use `--interval` option. This option allows you to set the minimum interval of sending notifications in seconds. If you set this option to 60, the next detection message will not be notified until 60 seconds have passed once the device has detected a smoker.

You will not receive a large number of notifications by the continued detection of the same smoker.

## License

This project is licensed under the GPL-3.0 License - see the `LICENSE` file for details.

## Acknowledgments

Thanks to these projects we completed this projects.

- [YOLOv5 by Ultralitics](https://github.com/ultralytics/yolov5)
- [NVIDIA L4T ML Docker Image](https://ngc.nvidia.com/catalog/containers/nvidia:l4t-ml)  
