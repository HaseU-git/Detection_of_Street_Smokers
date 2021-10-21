# jetson_team_c

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
