#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# Set locale
# LANG="zh_CN.UTF-8"
# LANGUAGE="zh_CN.UTF-8:en_US:en"
# LC_ALL="zh_CN.UTF-8"
# export LANG="en_US.UTF-8"
# export LANG="zh_CN.UTF-8"
# export LANGUAGE="en_US.UTF-8"
# export LC_CTYPE="zh_CN.UTF-8"
# export LC_COLLATE="C"
# export LC_NUMERIC="zh_CN.UTF-8"
# export LC_TIME="zh_CN.UTF-8"
# export LC_MONETARY="zh_CN.UTF-8"
# export LC_MESSAGES="zh_CN.UTF-8"
# export LC_TELEPHONE="zh_CN.UTF-8"

# Important for Emacs to get IM method
# export XIM=fcitx
# export XIM_PROGRAM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'

# Set correct term for tmux
# export TERM="screen-256color"

# PATH Envitonments
# PATH="/usr/local/heroku/bin:$PATH"
# PATH="/home/nplx/.cargo/bin:$PATH"

# VirtEnvWrapper     # slowing down Tmux
# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh
