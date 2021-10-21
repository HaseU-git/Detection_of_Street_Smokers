# プロジェクトの名前

Smoker detection application with [YOLOv5](https://github.com/ultralytics/yolov5) on [Jetson Nano](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/)  

![github](https://user-images.githubusercontent.com/64348058/138314179-14dfeb87-90bd-4731-a1b8-b4e709240762.gif)

## Table of context
- About the project
	- Background
	- What this application do
	- Why Jetson Nano and YOLOv5
	- Built With
- Getting Started
	- Prerequisites
	- Installation
- Usage
	- Detect Only
	- Detect and Notify


## About The Project

### Background

It is clear that smoking poses health and environmental problems. Particularly in recent years, with the decrease in the number of smoking areas, there are concerns about littering and passive smoking. However, it is difficult to constantly monitor smoking and call attention on the streets.  
Our project sends a notification when it detects smokers, so it can efficiently prevent smoking on the streets.

### What this application do

This project using the Jetson Nano detects in areas where smoking is prohibited. Detection is conducted by YOLOv5s model.  
When a smoker is detected, notifications can be sent to various services and applications such as Slack, LINE, IFTTT, etc. to inform the administrator of the abnormality.

#### Why Jetson Nano and YOLOv5
We wonder if NVIDIA Jetson Nano can detect specific object in real-time by using YOLOv5 because we couldn't find any real-time detection project using YOLOv5. The use of edge AI is expanding. We tought more problems will be solved if it works well.

### Built With
- NVIDIA Docker: 2.0.3 Engine: 20.10.7
- YOLOv5 by ultralytics

We are assuming that this application is used on NVIDIA Jetson Nano so it might not work well if you do not use this device. Our project runs Docker container to prevent this kind of situation  but we cannot assure that no errors will occur.  

## Getting Started

Let's clone this repoository into your NVIDIA Jetson Nano.

```shell
git clone https://github.com/Hase-U/Smoker_Notifier
```

<img width="1329" alt="スクショ 2021-10-22 at 1 11 33" src="https://user-images.githubusercontent.com/64348058/138316469-1a646799-feed-48bd-9130-d818a831d4d3.png">


Next, follow the documents below.

### Prerequisites

Before run this application, there are some requirements so please check them.


#### Docker

We use NVIDIA-Docker to start this project so you have to check that appropriate Docker is installed in your device. If your device do, you can start docker using following code.

Check version
```
nvidia-docer version
```

Check Docker daemon status

```
service docker status
```

Start Docker deamon
```
service docker start
```

<hr>

#### Camera

We use [this USB Camera](https://www.logitech.com/en-us/products/webcams/c270-hd-webcam.960-000694.html) for detection.    

カメラの写真

If you use CSI Camara or other cameras you might have to rewrite our source code. (For example `-v` option of `docker run` command in `run_project.sh`)  

Please check if your camera is connected before run Docer container.


Check connection of cameras
```
ls /dev/video*
```

If the display show `/dev/video0`, your camera is connected.

<hr>

#### Webhook

If you want to accept the message when the device find the specific class (in this case when smoker is deteced), it is necessary to do the setting by following instruction.  

There are four template files for each webhook services (LINE, IFTTT, Discord and Slack). Following instruction is written in order to accept the detection message in Slack.  

##### Slack

Please sign up and log in Slack before settinng of the webhook. And you need to create workspace if you don't have any workspaces. 

If you done, you can click [here](https://slack.com/services/new/incoming-webhook). 

写真  

Then you can see this kind web page. You can choose workspaces by upper right pull down button and you can choose channels by center pull down button. Press `Add Incoming WebHooks integration` button and you can see following web page. 

写真  

`Webhook URL` shows your url so please copy this link.  
Open `wbhk.py` (it is in `ssdetector` directory) in text editor and paste webhook url into `YOUR_WEBHOOK_URL`.  

写真

If you done these steps, you can receive the message in Slack when device detect smoker.

<hr>

##### Others(Discord, IFTTT, LINE)

If you want to use other webhook services such as IFTTT, our repository has template files so you can use these files. 
(In case of IFTTT: `wbhk_discord.py`, In case of Discord: `wbhk_discord.py`, In case of LINE: `wbhk_discord.py`)  

You can copy the webhook URL in the similar way as Slack. But you have to change one more thing.  
Open `ssdetector.py` file.  You can find following code in the sixth line.  

```python
from wbhk import webhook_request
```

Replace `wbhk` with other wbhk file name. For example, rerwite as folloing code if you want to use IFTTT.

```python
from webhk_ifttt import webhook_request
```

Then you can receive the message from any services.

<hr>

#### Internet

The internet environment is reqired to clone YOLOv5 repositorry. We reccomend attaching wi-fi adoptor to connect the Internet.
This is the [wi-fi adoptor](https://www.elecom.co.jp/products/WDC-150SU2MBK.html) that I use.

Wi-Fiドングルの写真

You can check your network environment using folloing command.  

```
ifconfig
```
<hr>

### Installation

You can install our project by doing following steps.

1. Clone YOLOv5 and integrate our source code
2. Build the docker image and run the docker container  

#### YOLOv5

First, you have to clone YOLOv5 and integrate our code. We prepare shell scrip to do this. Please command following code.

```shell
sudo chmod 744 integrate_yolov5.sh
./integrate_yolov5.sh
```

<hr>

#### Docker

Second, pull Docker image and build Docker image. Then run the docker container. Again, we prepare shell scrip to do this. Please command following code.

```shell
sudo chmod 744 run_docker.sh
./run_docker.sh
```
It takes several minutes unil finish this process. Wait patiently :)
Finally, you loged in Docker container.

<hr>

## Usage

Let's detect!!

### Detect Only

If you do not want to receive any messages, please command following code.  

```shell
cd /location/in/container/yolov5
python3 detect_only.py --source 0 --weights weight.pt
```

This code is default detection code YOLOv5 so please visit [this page](https://github.com/ultralytics/yolov5) if you want to know more detail.

<hr>

### Detect and Notify

If you want receive the message from device when specific class is detected, please command following code.

```shell
cd /location/in/container/yolov5
python3 ssdetector.py --source 0 --interval 60
```

You can use `--interval` option. This option can set the interval of sending message in seconds. If you set this option to 60, detection messages will not notify until 60 seconds pass from the first time that device detect smoker. 
 
So you can set `--interval` option to 1 if you want receive every seconds.

<hr>

## Roadmap

## Contribution

## License

## Contact

## Acknowledgments

## Device

NVIDIA Jetson Nano

## Technologies

