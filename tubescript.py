import requests

tflResponse = requests.get('https://api.tfl.gov.uk/Line/Mode/tube%2Cdlr%2Coverground%2Celizabeth-line/Status?detail=true')
if tflResponse.status_code != 200:
	print('{} {}'.format('Error Status code ==>-',tflResponse.status_code))    
for tubeLines in tflResponse.json():
    print('{0:40} {1:20} ==> {2:20}'.format('',tubeLines['name'],tubeLines['lineStatuses'][0]['statusSeverityDescription']))
