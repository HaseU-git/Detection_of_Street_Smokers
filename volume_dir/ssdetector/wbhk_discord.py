import time
import requests

WEB_HOOK_URL = 'YOUR_WEBHOOK_URL'

def webhook_request(img):
    data = {'content' : f"{time.strftime('%Y/%m/%d %H:%M:%S')} Smoker Detected"}
    response = requests.post(WEB_HOOK_URL, data=data)
    print(response.content)