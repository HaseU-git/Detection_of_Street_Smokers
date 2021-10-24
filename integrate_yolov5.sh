cd volume_dir
git clone https://github.com/ultralytics/yolov5.git

mv yolov5/detect.py yolov5/detect_only.py
mv *.py yolov5
mv weight.pt yolov5

cd yolov5
sed -i "s/opencv-python/# opencv-python/g" requirements.txt
