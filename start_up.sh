git clone https://github.com/ultralytics/yolov5
cd yolov5
sed -i "s/opencv-python/# opencv-python/g" requirements.txt
pip3 install -r requirements.txt
python3 detect.py --source 0 --weights ../best.pt