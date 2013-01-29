#-----------------------------------------
# Name:       Conky Weather Output
# Author:     Charles Gu
#-----------------------------------------
#!/usr/bin/env python

import yc

ccc = yc.curCon('code')
# Output condition icons for conky
if ccc == "0":#tornado
	cwo = "1"
elif ccc == "1":#tropical storm
	cwo = "2"
elif ccc == "2":#hurricane
	cwo = "3"
elif ccc == "3":#severe thunderstorms
	cwo = "m"
elif ccc == "4":#thundertorms
	cwo = "l"
elif ccc == "5":#mixed rain and snow
	cwo = "x"
elif ccc == "6":#mixed rain and sleet
	cwo = "x"
elif ccc == "7":#mixed snow and sleet
	cwo = "y"
elif ccc == "8":#freezing drizzle
	cwo = "w"
elif ccc == "9":#drizzle
	cwo = "s"
elif ccc == "10":#freezing rain
	cwo = "u"
elif ccc == "11":#showers
	cwo = "s"
elif ccc == "12":#showers
	cwo = "s"
elif ccc == "13":#snow flurries
	cwo = "o"
elif ccc == "14":#light snow showers
	cwo = "p"
elif ccc == "15":#blowing snow
	cwo = "6"
elif ccc == "16":#snow
	cwo = "q"
elif ccc == "17":#hail
	cwo = "8"
elif ccc == "18":#sleet
	cwo = "x"
elif ccc == "19":#dust
	cwo = "7"
elif ccc == "20":#foggy
	cwo = "9"
elif ccc == "21":#haze
	cwo = "e"
elif ccc == "22":#smoky
	cwo = "9"
elif ccc == "23":#blustery
	cwo = "7"
elif ccc == "24":#windy
	cwo = "0"
elif ccc == "25":#cold
	cwo = "-"
elif ccc == "26":#cloudy
	cwo = "f"
elif ccc == "27":#mostly cloudy (night)
	cwo = "D"
elif ccc == "28":#mostly cloudy (day)
	cwo = "d"
elif ccc == "29":#partly cloudy (night)
	cwo = "C"
elif ccc == "30":#partly cloudy (day)
	cwo = "c"
elif ccc == "31":#clear (night)
	cwo = "A"
elif ccc == "32":#sunny
	cwo = "a"
elif ccc == "33":#fair (night)
	cwo = "B"
elif ccc == "34":#fair (day)
	cwo = "b"
elif ccc == "35":#mixed rain and hail
	cwo = "y"
elif ccc == "36":#hot
	cwo = "5"
elif ccc == "37":#isolated thunderstorms
	cwo = "l"
elif ccc == "38":#scattered thunderstorms
	cwo = "l"
elif ccc == "39":#scattered thunderstorms
	cwo = "l"
elif ccc == "40":#scattered showers
	cwo = "g"
elif ccc == "41":#heavy snow
	cwo = "r"
elif ccc == "42":#scattered snow showers
	cwo = "p"
elif ccc == "43":#heavy snow
	cwo = "r"
elif ccc == "44":#partly cloudy
	cwo = "c"
elif ccc == "45":#thundershowers
	cwo = "m"
elif ccc == "46":#snow showers
	cwo = "q"
elif ccc == "47":#isolated thundershowers
	cwo = "l"
#elif ccc == "3200":#not available
#	cwo = ""
else:
	cwo = ""
print(cwo)
