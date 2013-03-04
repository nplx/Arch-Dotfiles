#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# [[ $TERM != screen* ]] && exec tmux -2

# Set prompt
#PS1='\[\033[0m\]┌──[\[\033[1;36m\]\u\[\033[1;33m\]@\[\033[1;36m\]\H\[\033[0m\]]──[\[\033[1;32m\]\w\[\033[0m\]]\n\[\033[0m\]└──► \[\033[0m\]'
#Powerline-bash
#function _update_ps1(){
#	export PS1="$(~/Files/Scripts/Py/powerline-bash.py)"
#}
#export PROMPT_COMMAND="_update_ps1"

#fortune -a | cowsay -f moose
# echo -e "\033[0;30m//////////////////////////////////////////////////////////////////////////////"
# echo -e "\033[1;36m|¯¯¯¯¯¯¯||¯|\¯\'|¯| |¯|  /¯¯/\¯¯\|¯¯¯¯¯¯¯|  |¯ \|¯|/¯/\¯\  /¯/\¯\|¯ \|¯||¯|\¯\ "
# echo -e "\033[1;35m'¯¯|'|¯¯’|'|/ / |'|_|'|__\  '\'¯¯'¯¯|'|¯¯’  |'|\ '|| ||'|  | ||'||'|\ '|| ’'>_ "
# echo -e "\033[1;34m  '|_|   |_|\_\ '\___/'\__\/__/    '|_|     |_| |_|\_\/_/  \_\/_/|_| |_||_|/_/ "
# echo -e "\033[0;30m//////////////////////////////////////////////////////////////////////////////"

# Set xterm transparent
[ -n "$WINDOWID" ] && transset-df -i $WINDOWID .75 >/dev/null
# Set xterm 256 color
export TERM="xterm-256color"
# Include ibus/fcitx input module
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
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
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'
alias grep='grep --color=auto'
alias ps?='ps aux | grep'
alias reload='source ~/.bashrc'
alias close='killall screen'
alias shred='shred -vfz -n 30'
alias pacOrph='pacman -Qtdq'
alias pacrm='pacman -Rns'
alias pacRm='pacman -Rcns'
alias fehview='feh -g 512x384 --zoom fill -. -x'
alias fehlist='feh -l -r'
alias rt="rtorrent"
alias nload="nload -u K -i 4000 -o 4000"
alias mutt="mutt -F ~/.mutt/.gmail.muttrc"
alias muttnplx="mutt -F ~/.mutt/.nplx.muttrc"
alias mounvideo="sudo mount -t cifs -o username=Administrator //192.168.1.100/Videos /mnt/videos"
alias mounmusic="sudo mount -t cifs -o username=Administrator //192.168.1.100/Music /mnt/music"
alias mounwork="sudo mount -t cifs -o username=Administrator //192.168.1.100/Workspace /mnt/work"
alias mounusb="sudo mount -t vfat /dev/sdb1 /mnt/usbdisk"
alias sublime="~/Applications/Sublime\ Text\ 2/./sublime_text"
alias sshcjb="ssh nplx@216.194.70.6 -p 443"
alias ssharbor="ssh m-net.arbornet.org"
alias scpcjb="scp://nplx@216.194.70.6/"
#alias sshtunnel="ssh -ND 9394 -v nplx@216.194.70.6 -p 443"
alias watchstarwar="telnet towel.blinkenlights.nl"
alias youtubestream="~/Files/Scripts/Shell/./youtubestream.sh"
#alias yt3="youtube-viewer -3"
alias mplayer="mplayer -osdlevel 3 -framedrop "
alias wallproxy="python2 ~/Applications/WallProxy/startup.py > /dev/null 2>&1 &"
alias goagent="python2 ~/Applications/GoAgent/proxy.py > /dev/null 2>&1 &"
alias backup_pkg_list='pacman -Qqe | grep -vx "$(pacman -Qqm)" > ~/.pkg_backup.list & pacman -Qqm > ~/.yaourt_backup.list'

## Functions ##
#
# Wakeup Neo
function wakeupneo(){
	clear
	echo -e "\033[1;32mWake up, Neo." | pv -qL 6
	sleep 5
	clear
	echo -e "\033[1;32mThe Matrix has you..." | pv -qL 6
	sleep 5
	clear
	echo -e "\033[1;32mFollow the white rabbit." | pv -qL 6
	sleep 5
	clear
}
#
# Public IP check
function pubip_check(){
	#PUBIP=$(curl -s ifconfig.me)
    PUBIP=$(curl -s ipchicken.com | awk 'NR==35 {print $1}')
	echo -e "Your Public IP is:\033[1;34m[\033[1;37m$PUBIP\033[1;34m]"
}
#
# Proxy
function proxyon(){
    export http_proxy="http://127.0.0.1:8087/"
    export https_proxy="http://127.0.0.1:8087/"
    export ftp_proxy="http://127.0.0.1:8087/"
#    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
	PUBIP=$(curl -s ipchicken.com | awk 'NR==35 {print $1}')
    echo -e "Proxy is on.\nYour public IP is:\033[1;32m$PUBIP\n\033[0mHave fun!"
}
function proxyoff(){
    unset HTTP_PROXY
    unset http_proxy
    unset HTTPS_PROXY
    unset https_proxy
    unset FTP_PROXY
    unset ftp_proxy
    #	PUBIP=$(curl -s ip.nu | awk '/[0-9]/ {print $5}')
    PUBIP=$(curl -s ipchicken.com | awk 'NR==35 {print $1}')
	echo -e "Proxy is off.\nYour public IP is:\033[1;31m$PUBIP\n\033[0mYou're on your own now."
}
#
# Query Wiki
function wiki(){
	dig +short txt "$*".wp.dg.cx;
}
#
# Git Prompt
function _git_prompt(){
    local git_status="`git status -unormal 2>&1`"
    local git_abbrev_hash="`git log -1 --pretty=format:%h 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=45
        else
            local ansi=41
        fi
        if [[ "$git_status" =~ on\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            branch="`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`"
        fi
        echo -e '\[\033[0;37;'"$ansi"';1m\]'"$branch"'\[\033[0;43m'"$git_abbrev_hash"'\[\033[0m\]'
    fi
}
function _prompt_command(){
    PS1='\[\033[0m\]┌──[\[\033[1;34m\]\u\[\033[1;33m\]@\[\033[1;34m\]\H\[\033[0m\]]──[\[\033[1;32m\]\w\[\033[0m\]]'"`_git_prompt`"'\n\[\033[0m\]└──► \[\033[0m\]'
}
PROMPT_COMMAND=_prompt_command
