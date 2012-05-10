#!/usr/bin/env python

import urllib.request
from xml.dom.minidom import parseString

file = urllib.request.urlopen("http://www.google.com/ig/api?weather=#&hl=#")
data = file.read()
file.close()
dom = parseString(data)

# Unused method
#elemList = ["postal_code","condition","temp_c","humidity","wind_condition"]
#for elem in elemList:
#	currentData = dom.getElementsByTagName(elem)[0].getAttribute("data")
#	print (currentData)

# Get current temperature
currentTemp = dom.getElementsByTagName("temp_c")[0].getAttribute("data")
#currentTemp = dom.getElementsByTagName("temp_f")[0].getAttribute("data")

# Get current conditions
#currentCondition = dom.getElementsByTagName("condition")[0].getAttribute("data")

print(currentTemp)
