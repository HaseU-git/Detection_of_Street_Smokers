---
marp: true
headingDivider: 2
footer: Jetson（team_c）
---

# Jetson（team_c）
Date:2021-09-08

<!-- _class: title -->

## 案決め  

### 前回までの案
- ソーシャルディスタンス（小池アラート
- 喫煙者検出
- 居眠りしてたらアラート
- ギターを作る
- 体をバーチャルにする（難しそう、、？）
- 白内障、緑内障検出（調べてみて）  
画像では判断できなそう  

***

### ギターの問題点
チーム5人で、学習するデータが5人分しかない  
→ 一般化できない可能性が出てくる  

### タバコ
喫煙者の検出は難易度的には簡単そう  
路上喫煙への抑止力てきな  
何かくわえてる顔だったら喫煙者  
[参考動画](https://www.youtube.com/watch?v=ov1Osh7zjss)  

## 方針

`一旦タバコ → 無理ならマスク`  

## 必要な作業

- 動画から画像に変換する（土合さんのプログラム）  
※ アスペクト比が一定でなるべく高画質なもの  

- 画像をアノテーションする  
[ツールへリンク](https://github.com/tzutalin/labelImg)  

- YOLO3 / YOLO5を使って、学習する  

- ハイパーパラメーターの調整  

- 学習が終わったらリアルタイムで実装できるようにする  

- デモ動画用の実演データ  

- 時間余ったらwebアプリにする  

***

```python
import os
import cv2
import tkinter, tkinter.filedialog
​
def video_2_frames(video_file, image_dir='./images/', image_file='img_%s.jpg', step=1, offset=0):
    if not os.path.exists(image_dir):
        os.makedirs(image_dir)
​
    i = offset
    cap = cv2.VideoCapture(video_file)
    frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
​
    for index in range(0, frame_count, step):
        cap.set(cv2.CAP_PROP_POS_FRAMES, index)
        ret, frame = cap.read()
        if not ret:
            break
        cv2.imwrite(image_dir+image_file % str(i).zfill(6), frame)
        print('Save', image_dir+image_file % str(i).zfill(6))
        i += 1
​
    cap.release()
​
if __name__ == "__main__":
    root = tkinter.Tk()
    root.withdraw()
​
    fTyp = [("", "*.mp4")]
    iDir = "videos"
    file = tkinter.filedialog.askopenfilename(filetypes=fTyp, initialdir=iDir)
    if not file: exit()
​
    step = input("Extraction Step: ")
    offset = input("Index Offset: ")
    video_2_frames(video_file=file, step=int(step), offset=int(offset))
```


***

### 必要な機材

- アラート  

### 必要なお金

なし


## 期限など

10月11日が中間  
10月22日がプレゼン  

## 割り振り

| 担当者 | タスク     | 期限   |
| :-: | :-----: | :--: |
| 長谷川 | 0-99    | 9/15 |
| 伊藤  | 100-199 | 9/15 |
| 二宮  | 200-299 | 9/15 |
| 前山  | 300-399 | 9/15 |
| 土合  | 400-499 | 9/15 |

## 進め方
- 動画は各個人で探して、Slackで
- 各自100枚くらいを用意する  
- 1280 * 720 (16:9)で探して、なさそうだったら低画質に  
- True / False（吸っていたらTrue）  
- 顔（タバコまで入れて）を四角でかこう  

## 要確認事項
- 複数人で開発する時に、評価するのは各個人のコードの量？チームでのタスク？  
- YouTube動画のダウンロードの利用規約  

## 今後話し合うこと
- アノテーション以降の進め方
- アピールはどうするか
	- 動画  
	- Github  
	- README / プレゼン  

<style>


section.title{
	text-align: center;
}

h1 {
	font-size: 100px;
}

h2 {
	position: absolute;
	top: 50px;
	font-size: 50px;
}
</style>