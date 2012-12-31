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
  /usr/bin/xmodmap $HOME/.Xmodmap
fi

# Set Wallpaper
eval `cat ~/.fehbg` &

# Set Transparent
#xcompmgr -nCc &
#xcompmgr -nCcfF -I-0.15 -O-.03 -D2 -r2 -o.75 &
 
##
# Set tint2
#exec tint2 &

# Set conky
exec conky &

# Run Dropbox
#exec dropboxd &

# Set Locale
#export LANG=zh_CN.UTF-8
#export LC_ALL="zh_CN.UTF-8"

#exec dwm
#exec openbox-session
exec dbus-launch openbox-session 
#exec dbus-launch --exit-with-session openbox-session


