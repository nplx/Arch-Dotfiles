# Set alias
# alias sudo='sudo '
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -alh'
alias cp='acp -g'
# alias cp='rsync -ahP'
alias mv='amv -ig'
alias rm='trash -v'
alias mkdir='mkdir -p -v'
alias df='df -h -T'
alias du='du -h -c'
alias grep='grep --color=auto'
alias ps?='ps auxf | grep -v grep | grep -i'
alias reload='source ~/.bashrc'
# alias vim='nvim'
alias tmux='tmux -2'
alias close='killall screen'
alias cal='cal -m'
alias shred='shred -vfz -n 30'
alias pacOrph='pacman -Qtdq'
alias fehview='feh --zoom fill -. -x'
alias fehlist='feh -l -r'
alias screenshot="scrot 'Screenshot-%Y-%m-%d-%_$wx$h_scrot.png' -e 'mv $f ~/Pictures/Screenshots/'"
# alias emacs="emacs -nw"
# alias emacs="XMODIFIERS=@im=fcitx emacs"
# alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"
alias deepin-screenshot="LANG=zh_CN.UTF-8 deepin-screenshot"
alias nload='nload -u K -i 22000 -o 20000 wlp2s0'
# alias mutt='tsocks mutt -F ~/.mutt/.gmail.muttrc'
alias mutt='tsocks neomutt -F ~/.mutt/.gmail.muttrc'
# alias muttnplx='tsocks mutt -F ~/.mutt/.nplx.muttrc'
alias muttnplx='tsocks neomutt -F ~/.mutt/.nplx.muttrc'
# alias mountDmovie="sudo mount -t cifs -o username=Home //192.168.1.100/DMovies /mnt/videos"
# alias mountEmovie="sudo mount -t cifs -o username=Home //192.168.1.100/EMovies /mnt/videos"
# alias mountFmovie="sudo mount -t cifs -o username=Home //192.168.1.100/FMovies /mnt/videos"
# alias mountmusic="sudo mount -t cifs -o username=Home //192.168.1.100/Music /mnt/music"
alias mountusb="sudo mount -t vfat /dev/sdb1 /mnt/usb_stick"
alias sublime="~/Applications/sublime_text_3/./sublime_text"
# alias sshnanovz="ssh 192.111.152.114 -p 22700"
# alias sshmsp="ssh 198.23.200.61 -p 22"
alias sshmsp="ssh -C myserverplanet"
alias sshlitr="ssh -CY litr"
alias sshbrie="ssh -C briehost"
alias sshquad="ssh -C quadhost"
alias sshvirmach="ssh -C virmach"
alias sshhostmybytes="ssh -C hostmybytes"
# alias aria="aria2c --enable-rpc --rpc-listen-all > /dev/null 2>&1 &"
alias watchstarwar="telnet towel.blinkenlights.nl"
# alias youtubestream="~/Files/Scripts/Bash/./youtubestream.sh"
alias dict="ydcv -f --color auto"
# alias mplayer="mplayer -af volume=20:1 -osdlevel 3 -framedrop "
alias mpv="mpv --hwdec=vaapi"
alias newmail="python ~/Files/Scripts/Py/newmailnotifier.py > /tmp/.new-mail-script.log 2>&1 &"
alias jigglethecursor="python ~/Files/Scripts/Py/cursorJiggler.py"
alias backup_pkg_list='pacman -Qqe | grep -vx "$(pacman -Qqm)" > ~/.pkg_backup.list & pacman -Qqm > ~/.yaourt_backup.list'
# alias cpu_on_demand="sudo cpupower frequency-set -g ondemand"
# alias cpu_performance="sudo cpupower frequency-set -g performance"
alias screenoff='sleep 1 && xset dpms force off'
alias screenblankoff='xset s off -dpms'
alias screenblank='xset s on'
alias backlightAlwaysOn='xset dpms s off'
alias backlightAuto='xset dpms s on'
alias VirtWrapper="export WORKON_HOME=~/.virtualenvs; source /usr/bin/virtualenvwrapper.sh"
alias chromium="chromium --window-size=1192,745 --enable-accelerated-compositing"
alias chromfresh="chromium --user-data-dir=/home/nplx/.cache/chromium-fresh --window-size=1192,745 --enable-accelerated-compositing"
# alias WebTorrent="~/Applications/WebTorrent-linux-x64/./WebTorrent > /dev/null 2&1 &"
# alias pypy-pip="/opt/pypy3/bin/pip3"
alias qr="qrencode -t UTF8"
alias rand_pass_gen="< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;"
alias rand_pass_gen_16="< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;"
# alias wttr="curl -s wttr.in/tianjin | head -n -2" # need golang wego flask geoip2 geopy requests gevent
alias osCreatedDate="head -n1 /var/log/pacman.log"
