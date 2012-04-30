#!/bin/sh
#
#~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f /$HOME/.Xmodmap ]; then
  /usr/bin/xmodmap /home/me/.Xmodmap
fi

#exec ck-launch-session 
#exec openbox-session &

# ...or the Window Manager of your choice

# Set Transparent
xcompmgr -n &
#xcompmgr -nCcfF -I-0.15 -O-.03 -D4 -l-5 -r4.2 -o.75 &
#transset-df .65 > /dev/null &
 
##
# Set tint2
exec tint2 &

# Set conky
exec conky &

# Set Wallpaper
eval `cat ~/.fehbg` &

# Run Dropbox
#exec dropboxd &

# Set Locale
#export LANG=zh_CN.UTF-8
#export LC_ALL="zh_CN.UTF-8"

#exec dwm
#exec awesome
exec ck-launch-session openbox-session
exec ck-launch-session dbus-launch ~/.xstart

