import time
import json
import requests

WEBHOOK_URL = 'https://hooks.slack.com/services/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'

def webhook_request(img):
    data = {'text' : f"{time.strftime('%Y/%m/%d %H:%M:%S')} Smoker Detected"}
    response = requests.post(WEBHOOK_URL, data=json.dumps(data))
    print(response.content)