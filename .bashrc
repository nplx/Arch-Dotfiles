#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Set alias
alias sudo='sudo '
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd'
alias ll='ls -l -h'
alias la='ls -a'
alias lla='ls -al -h'
alias cp='acp -g'
alias mv='amv -g'
alias rm='rm -v'
#alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'
alias grep='grep --color=auto'
alias reload='source ~/.bashrc'
alias close='killall screen'
alias fehview='feh -g 512x384 --zoom fill -. -x'
alias fehlist='feh -l -r'
alias fehbg='feh --bg-scale'
#alias ardef="sudo ip route add default dev ppp0"
alias rt="rtorrent"
alias mounvideo="sudo mount -t cifs -o username=Administrator //192.168.1.100/Videos /mnt/videos"
alias mounmusic="sudo mount -t cifs -o username=Administrator //192.168.1.100/Music /mnt/music"
alias sublime="~/Applications/Sublime\ Text\ 2/./sublime_text"
alias sshcjb="ssh nplx@216.194.70.6 -p 443"

#PS1='[\u@\h \W]\$ '
PS1='\[\033[0m\]┌──[\[\033[1;32m\]\u\[\033[0;33m\]@\[\033[1;32m\]\H\[\033[0m\]]──(\[\033[1;32m\]\w\[\033[0m\])\n\[\033[0m\]└──► \[\033[0m\]'
#PS2='\\ '
#PS1='[0;32m\][\u@\h]'

echo 'Trust No One!'

# Set xterm transparent
[ -n "$WINDOWID" ] && transset-df -i $WINDOWID .65 >/dev/null
# Include ibus input module
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
