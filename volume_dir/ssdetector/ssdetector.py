import sys
import time
import argparse
from pathlib import Path
from detect import run
from wbhk import webhook_request
from utils.general import check_requirements

FILE = Path(__file__).resolve()
ROOT = FILE.parents[0]  # YOLOv5 root directory
if str(ROOT) not in sys.path:
    sys.path.append(str(ROOT))  # add ROOT to PATH
ROOT = ROOT.relative_to(Path.cwd())  # relative

class ssdetector():
    def __init__(self, interval=30):
        self.time = 0
        self.interval = interval # seconds
        self.send_request = True

    def update(self, det, img):
        if len(det):
            exist_smoker = False
            for *_, cls in reversed(det):
                if int(cls) == 0:
                    exist_smoker = True
            if exist_smoker:
                if not self.send_request:
                    if time.time() - self.time > self.interval:
                        self.send_request = True
                if self.send_request:
                    webhook_request(img)
                    self.send_request = False
                self.time = time.time()

def parse_opt():
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', type=str, default=ROOT / 'data/images', help='file/dir/URL/glob, 0 for webcam')
    parser.add_argument('--imgsz', '--img', '--img-size', nargs='+', type=int, default=[640], help='inference size h,w')
    parser.add_argument('--conf-thres', type=float, default=0.25, help='confidence threshold')
    parser.add_argument('--iou-thres', type=float, default=0.45, help='NMS IoU threshold')
    parser.add_argument('--max-det', type=int, default=1000, help='maximum detections per image')
    opt = parser.parse_args()
    opt.imgsz *= 2 if len(opt.imgsz) == 1 else 1  # expand
    return opt

if __name__ == "__main__":
    opt = parse_opt()
    check_requirements(exclude=('tensorboard', 'thop'))
    detector = ssdetector(30)
    run(weights='weight.pt', nosave=True, **vars(opt), callback=detector.update)