#
# ~/.bashrc
#

export HISTCONTROL=ignoreboth
export HISTSIZE=20000

# export LC_CTYPE="zh_CN.utf8"
# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
# [[ $TERM != screen* ]] && exec tmux -2

fortune -a | cowsay -f moose
# echo -e "\033[0;30m//////////////////////////////////////////////////////////////////////////////"
# echo -e "\033[1;36m|¯¯¯¯¯¯¯||¯|\¯\'|¯| |¯|  /¯¯/\¯¯\|¯¯¯¯¯¯¯|  |¯ \|¯|/¯/\¯\  /¯/\¯\|¯ \|¯||¯|\¯\ "
# echo -e "\033[1;35m'¯¯|'|¯¯’|'|/ / |'|_|'|__\  '\'¯¯'¯¯|'|¯¯’  |'|\ '|| ||'|  | ||'||'|\ '|| ’'>_ "
# echo -e "\033[1;34m  '|_|   |_|\_\ '\___/'\__\/__/    '|_|     |_| |_|\_\/_/  \_\/_/|_| |_||_|/_/ "
# echo -e "\033[0;30m//////////////////////////////////////////////////////////////////////////////"
# Set terminal transparent
[ -n "$WINDOWID" ] && sleep .1 && transset-df -a --id $WINDOWID .8 >/dev/null
# gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
# Coloring man page
export PAGER="most"
# Load aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

## Functions ##
#
# Wakeup Neo
function wakeupneo(){
    clear
    echo -e "\033[1;32mWake up, Neo." | pv -qL 4
    sleep 5
    clear
    echo -e "\033[1;32mThe Matrix has you..." | pv -qL 5
    sleep 5
    clear
    echo -e "\033[1;32mFollow the white rabbit." | pv -qL 6
    sleep 5
    clear
}
#
# Public IP check
function pubip_check(){
    # PUBIP=$(curl -s ifconfig.me)
    # PUBIP=$(curl -s api.ipify.org)
    PUBIP=$(curl -s ipinfo.io | sed -n 2p | cut -d '"' -f4)
    echo -e "Your Public IP is:\033[1;34m[\033[1;37m$PUBIP\033[1;34m]"
}
#
# Proxy
function proxyon(){
    # export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

    export http_proxy="http://127.0.0.1:8087"
    # echo "$http_proxy"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export RSYNC_PROXY=$http_proxy
    # PUBIP=$(curl -s api.ipify.org)
    PUBIP=$(curl -s ipinfo.io | sed -n 2p | cut -d '"' -f4)
    # echo -e "Proxy is on.\nYour public IP is: \033[1;32m$PUBIP\n\033[0mHave fun!"
    echo -e "Your Public IP is:\033[1;34m[\033[1;37m$PUBIP\033[1;34m]\n\033[0mHave fun!"
}
function proxyoff(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy

    # PUBIP=$(curl -s api.ipify.org)
    PUBIP=$(curl -s ipinfo.io | sed -n 2p | cut -d '"' -f4)
    # echo -e "Proxy is off.\nYour public IP is:\033[1;31m$PUBIP\n\033[0mYou're on your own now."
    echo -e "Your Public IP is:\033[1;34m[\033[1;37m$PUBIP\033[1;34m]\n\033[0mYou're on your own now."
}
#
# Git Prompt
function _git_prompt(){
    local git_status="`git status -unormal 2>&1`"
    local git_abbrev_hash="`git log -1 --pretty=format:%h 2>&1`"
    if ! [[ "$git_status" =~ not\ a\ git\ repo ]]; then
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
        echo -e '-[\[\033[0;37;'"$ansi"';1m\]'"$branch"'\[\033[0;45m'"$git_abbrev_hash"'\[\033[0m\]]'
    fi
}
#
# Virtualenv
function _virtualenv_info() {
    if [[ $VIRTUAL_ENV != "" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo -e "─[VENV:$venv]"
}
#
# Prompt
function _prompt_command(){
    # PS1='\[\033[0m\]┌──[\[\033[1;34m\]\u\[\033[1;33m\]@\[\033[1;34m\]\H\[\033[0m\]]──[\[\033[1;32m\]\w\[\033[0m\]]'"`_virtualenv_info``_git_prompt`"'\n\[\033[0m\]└──►\[\033[0m\]'
    PS1='\[\033[0m\]┌──[\[\033[1;32m\]\w\[\033[0m\]]'"`_virtualenv_info``_git_prompt`"'\n\[\033[0m\]└──►\[\033[0m\]'
}
PROMPT_COMMAND=_prompt_command

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
