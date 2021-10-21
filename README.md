# プロジェクトの名前  

<hr>

## 使い方

USBカメラ、Wi-Fiドングル、キーボードHDMIを繋げてJetsonを起動。

Jetson上で以下のコマンドを実行する。

git clone yolov5をクローンして  
```
mkdir work_dir
cd work_dir

mkdir volume_dir
```

このリポジトリをクローン
```
git clone https://github.com/HaseU-git/jetson_team_c/

cp jetson_team_c/
```

Dockerを起動するところまで
（10分程度時間がかかる）
```
chmod 744 jetson_team_c/run_docker.sh
jetson_team_c/runproject.sh
```

Docker上でプログラムを実行するまで
（15分程度時間がかかる）
```
./start_up.sh

```
<hr>


# プロジェクトの名前

Smoker detection application with [YOLOv5](https://github.com/ultralytics/yolov5) on [Jetson Nano](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/)  

**写真 or 動画でも入れる？？**  

<hr>

## プロジェクトについて

<hr>

<hr>

## 社会的背景について

<hr>


<hr>

## YOLOv5を使用した理由について？

<hr>

We couldn't find any real-time detection project using YOLOv5. 

We are assuming that this application is used on NVIDIA Jetson Nano so it might not work well if you do not use this device. Our project runs Docker container to prevent this kind of situation  but we cannot assure that no errors will occur.

## チャットbotについて？  

## Table of context
- About the project
	- Built With
- Getting Started
	- Prerequisites
	- Installation
- Usage


## About The Project

### Built With
- NVIDIA Docker: 2.0.3 Engine: 20.10.7
- YOLOv5 by ultralytics

## Getting Started

### Prerequisites

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

If you done, you can click [here](workspace). 

写真  

Then you can see this kind web page. You can choose workspaces by upper right pull down button and you can choose channels by center pull down button. Press `Add Incoming WebHooks integration` button and you can see following web page. 

写真  

`Webhook URL` shows your url so please copy this link.  
Open `wbhk.py` (it is in `ssdetector` directory) in text editor and paste webhook url into `YOUR_WEBHOOK_URL`.  

写真

If you done these steps, you can receive the message in Slack when device detect smoker.

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

#### Internet

The internet environment is reqired to clone YOLOv5 repositorry. We reccomend attaching wi-fi adoptor to connect the Internet.
This is the [wi-fi adoptor](https://www.elecom.co.jp/products/WDC-150SU2MBK.html) that I use.

Wi-Fiドングルの写真

You can check your network environment using folloing command.  

```
ifconfig
``


### Installation

You can run our project by doing following steps.

1. Clone this repository  
2. Clone YOLOv5 and integrate our source code
3. Build the docker image and run the docker container  

#### YOLOv5

```
git clone https://HaseU-git/プロジェクト名  

```

#### Docker

```
sudo chmod 744 run_docker.sh
./run_docker.sh
```

```
```

### 

## Usage

## Roadmap

## Contribution

## License

## Contact

## Acknowledgments

## Device

NVIDIA Jetson Nano

## Technologies

