cd volume_dir
git clone https://github.com/ultralytics/yolov5.git

mv yolov5/detect.py yolov5/detect_only.py
mv ssdetector/* yolov5
rm -rf ssdetector

cd yolov5
sed -i "s/opencv-python/# opencv-python/g" requirements.txt