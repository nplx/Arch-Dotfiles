#!/usr/bin/env python

import urllib.request
from xml.dom.minidom import parseString

file = urllib.request.urlopen("http://www.google.com/ig/api?weather=#&hl=#")
#file = open("weatherConditions.xml","r")
data = file.read()
file.close()
dom = parseString(data)

# Unused method
#elemList = ["postal_code","condition","temp_c","humidity","wind_condition"]

#for elem in elemList:
#	currentData = dom.getElementsByTagName(elem)[0].getAttribute("data")

#	print (currentData)

# Get current temperature
#currentTemp = dom.getElementsByTagName("temp_c")[0].getAttribute("data")

# Get current condition
currentCondition = dom.getElementsByTagName("condition")[0].getAttribute("data")

# Get condition forecast
#forecastCondition = dom.getElementsByTagName("condition")[1].getAttribute("data")

# Output condition icons for conky
if currentCondition == "Cloudy":
	conditionCode = "d"
elif currentCondition == "Fog":
	conditionCode = "="
elif currentCondition == "Haze":
	conditionCode = "="
elif currentCondition == "Mostly Cloudy":
	conditionCode = "c"
elif currentCondition == "Overcast":
	conditionCode = "="
elif currentCondition == "Partly Cloudy":
	conditionCode = "b"
elif currentCondition == "Rain":
	conditionCode = "g"
elif currentCondition == "Showers":
	conditionCode = "h"
elif currentCondition == "Thunderstorm":
	conditionCode = "i"
elif currentCondition == "Mostly Sunny":
	conditionCode = "b"
elif currentCondition == "Partly Sunny":
	conditionCode = "c"
elif currentCondition == "Scattered Showers":
	conditionCode = "g"
elif currentCondition == "Sunny":
	conditionCode = "a"
elif currentCondition == "Snow":
	conditionCode = "j"
elif currentCondition == "Clear":
	conditionCode = "a"
else:
	conditionCode = " "

print(conditionCode)
