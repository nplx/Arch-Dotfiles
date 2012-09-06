#-----------------------------------------
# Name:       Yahoo Weather script
# Author:     Charles Gu
#-----------------------------------------
#!/usr/bin/env python

import urllib.request
from xml.dom.minidom import parseString

file = urllib.request.urlopen("http://weather.yahooapis.com/forecastrss?w=2159908&u=c")
data = file.read()
file.close()
dom = parseString(data)

# Get current condition
currentCondition = dom.getElementsByTagName("yweather:condition")[0].getAttribute("code")

# Output condition icons for conky
if currentCondition == "0":#tornado
	conkyWeatherOutput = "1"
elif currentCondition == "1":#tropical storm
	conkyWeatherOutput = "2"
elif currentCondition == "2":#hurricane
	conkyWeatherOutput = "3"
elif currentCondition == "3":#severe thunderstorms
	conkyWeatherOutput = "m"
elif currentCondition == "4":#thundertorms
	conkyWeatherOutput = "l"
elif currentCondition == "5":#mixed rain and snow
	conkyWeatherOutput = "x"
elif currentCondition == "6":#mixed rain and sleet
	conkyWeatherOutput = "x"
elif currentCondition == "7":#mixed snow and sleet
	conkyWeatherOutput = "y"
elif currentCondition == "8":#freezing drizzle
	conkyWeatherOutput = "w"
elif currentCondition == "9":#drizzle
	conkyWeatherOutput = "s"
elif currentCondition == "10":#freezing rain
	conkyWeatherOutput = "u"
elif currentCondition == "11":#showers
	conkyWeatherOutput = "s"
elif currentCondition == "12":#showers
	conkyWeatherOutput = "s"
elif currentCondition == "13":#snow flurries
	conkyWeatherOutput = "o"
elif currentCondition == "14":#light snow showers
	conkyWeatherOutput = "p"
elif currentCondition == "15":#blowing snow
	conkyWeatherOutput = "6"
elif currentCondition == "16":#snow
	conkyWeatherOutput = "q"
elif currentCondition == "17":#hail
	conkyWeatherOutput = "8"
elif currentCondition == "18":#sleet
	conkyWeatherOutput = "x"
elif currentCondition == "19":#dust
	conkyWeatherOutput = "7"
elif currentCondition == "20":#foggy
	conkyWeatherOutput = "9"
elif currentCondition == "21":#haze
	conkyWeatherOutput = "e"
elif currentCondition == "22":#smoky
	conkyWeatherOutput = "9"
elif currentCondition == "23":#blustery
	conkyWeatherOutput = "7"
elif currentCondition == "24":#windy
	conkyWeatherOutput = "0"
elif currentCondition == "25":#cold
	conkyWeatherOutput = "-"
elif currentCondition == "26":#cloudy
	conkyWeatherOutput = "f"
elif currentCondition == "27":#mostly cloudy (night)
	conkyWeatherOutput = "D"
elif currentCondition == "28":#mostly cloudy (day)
	conkyWeatherOutput = "d"
elif currentCondition == "29":#partly cloudy (night)
	conkyWeatherOutput = "C"
elif currentCondition == "30":#partly cloudy (day)
	conkyWeatherOutput = "c"
elif currentCondition == "31":#clear (night)
	conkyWeatherOutput = "A"
elif currentCondition == "32":#sunny
	conkyWeatherOutput = "a"
elif currentCondition == "33":#fair (night)
	conkyWeatherOutput = "B"
elif currentCondition == "34":#fair (day)
	conkyWeatherOutput = "b"
elif currentCondition == "35":#mixed rain and hail
	conkyWeatherOutput = "y"
elif currentCondition == "36":#hot
	conkyWeatherOutput = "5"
elif currentCondition == "37":#isolated thunderstorms
	conkyWeatherOutput = "l"
elif currentCondition == "38":#scattered thunderstorms
	conkyWeatherOutput = "l"
elif currentCondition == "39":#scattered thunderstorms
	conkyWeatherOutput = "l"
elif currentCondition == "40":#scattered showers
	conkyWeatherOutput = "g"
elif currentCondition == "41":#heavy snow
	conkyWeatherOutput = "r"
elif currentCondition == "42":#scattered snow showers
	conkyWeatherOutput = "p"
elif currentCondition == "43":#heavy snow
	conkyWeatherOutput = "r"
elif currentCondition == "44":#partly cloudy
	conkyWeatherOutput = "c"
elif currentCondition == "45":#thundershowers
	conkyWeatherOutput = "m"
elif currentCondition == "46":#snow showers
	conkyWeatherOutput = "q"
elif currentCondition == "47":#isolated thundershowers
	conkyWeatherOutput = "l"
#elif currentCondition == "3200":#not available
#	conkyWeatherOutput = ""
else:
	conkyWeatherOutput = ""
print(conkyWeatherOutput)
