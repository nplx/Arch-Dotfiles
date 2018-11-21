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

# Set Wallpaper
# eval `cat ~/.fehbg` &
# sh ~/.fehbg &

# Set Transparent
#xcompmgr -nCc &
#xcompmgr -nCcfF -I-0.15 -O-.03 -D2 -r2 -o.75 &

# if [ -f $HOME/.Xmodmap ]; then
#   sleep 3 && xmodmap $HOME/.Xmodmap
# fi

# Set conky
# exec conky &

# Set Locale
# export LANG="zh_CN.UTF-8"
# export LANGUAGE="zh_CN:en_US"
# export LC_CTYPE="zh_CN.UTF-8"

# Include ibus/fcitx input module
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
# ibus-daemon -drx

#exec dwm
# exec openbox-session
#exec dbus-launch openbox-session
#exec dbus-launch --exit-with-session openbox-session
# exec gnome-session
#### Xmonad
# 设置鼠标光标
# xsetroot -cursor_name left_ptr
# 设置键盘布局
# setxkbmap -layout en
# 启动xmonad
# exec xmonad
