import time
import json
import requests

WEBHOOK_URL = 'YOUR_WEBHOOK_URL'

def webhook_request(img):
    data = {'text' : f"{time.strftime('%Y/%m/%d %H:%M:%S')} Smoker Detected"}
    response = requests.post(WEBHOOK_URL, data=json.dumps(data))
    print(response.content)