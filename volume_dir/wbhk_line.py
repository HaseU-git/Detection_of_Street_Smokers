import time
import requests

WEBHOOK_URL = 'https://notify-api.line.me/api/notify'
TOKEN = 'YOUR_ACCESS_TOKEN'

def webhook_request(img):
    headers = {'Authorization' : f"Bearer {TOKEN}"}
    payload = {'message' : f"{time.strftime('%Y/%m/%d %H:%M:%S')} Smoker Detected"}
    response = requests.post(WEBHOOK_URL, headers=headers, params=payload)
    print(response.content)