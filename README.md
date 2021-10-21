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
chmod 744 jetson_team_c/run_project.sh
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

We will use the USB Camera（webカメラの種類を入れる） for detection. If you use CSI Camara or other cameras you might have to rewrite our source code. (For example `-v` option of `docker run` command in `run_project.sh`)  

Please check if your camera is connected before run Docer container.


Check connection of cameras
```
ls /dev/video*
```

If the display show `/dev/video0`, your camera is connected.

<hr>

#### Webhook

**webhookの設定の仕方をかく**

#### Internet

The internet environment is reqired to clone YOLOv5 repositorry. We reccomend attaching wi-fi adoptor to connect the Internet. You can check your network environment using folloing command.  

```
ifconfig
```

### Installation

You can run our project by doing following steps.

1. Clone this repository  
2. Clone YOLOv5 and integrate our source code
3. Build the docker image and run the docker container  

#### Github

```
git clone https://HaseU-git/プロジェクト名  

```

#### Docker

```
sudo chmod 744 run_docker.sh
```

#### 

## Usage

## Roadmap

## Contribution

## License

## Contact

## Acknowledgments

## Device

NVIDIA Jetson Nano

## Technologies

