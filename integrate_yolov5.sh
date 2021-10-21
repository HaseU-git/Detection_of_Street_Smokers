cd volume_dir
git clone https://github.com/ultralytics/yolov5.git

rm yolov5/detect.py
mv ssdetector/* yolov5
rm -rf ssdetector

mv best.pt yolov5

cd yolov5
sed -i "s/opencv-python/# opencv-python/g" requirements.txt
