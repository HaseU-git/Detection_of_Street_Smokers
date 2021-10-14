# jetson_team_c

## 使い方

USBカメラ、Wi-Fiドングル、キーボードHDMIを繋げてJetsonを起動。

Jetson上で以下のコマンドを実行する。

このリポジトリをクローン
```
git clone https://github.com/HaseU-git/jetson_team_c/
cd jetson_team_c
```

Dockerを起動するところまで
（10分程度時間がかかる）
```
chmod 744 run_project.sh
./runproject.sh
```

Docker上でプログラムを実行するまで
（15分程度時間がかかる）
```
./start_up.sh
```
