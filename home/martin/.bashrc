# show prompt as just current folder and $
PS1="\W \$ "

# open command
alias o='xdg-open'

let "year=$(date +'%Y')"
let "month=$(expr `date +%m` + 0)"

SEMESTER=Winter
if [[ $month -gt 8 ]]
then
   SEMESTER=Fall
fi

# a macro to reach current years sideproject folder (by appending current yr to end of this cd command)
alias sp='cd ~/Documents/sideprojects/'$year

alias school='cd ~/Documents/school/'$year-$((++year))/$SEMESTER

alias lid-stop='systemd-inhibit --what=handle-lid-switch --mode=block /bin/sh'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# for nvm to work
source /usr/share/nvm/init-nvm.sh

alias ls='ls --color=auto'
alias ll='ls -lais'
alias grep='grep --color=auto'

alias vnc-desktop-tunnel='ssh -t -L 5900:localhost:5900 192.168.0.104 "x11vnc -localhost -display :0 --loop"'
alias vnc-desktop-view='echo "!!!!! ENSURE vnc-desktop-tunnel is running !!!!!" && vncviewer -PreferredEncoding=ZRLE localhost:0'