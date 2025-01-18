PS1="\W \$ "
# show prompt as just current folder and $, unless tab is in use
if [[ -n "$TAB" ]]
then
	PS1="[$TAB]\n$PS1"
fi

# ruby home
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

alias find-node-modules="find . -name "node_modules" -type d -prune -print | xargs du -chs"
alias clear-node-modules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"

# open command
alias o='xdg-open'
let "year=$(date +'%Y')"
let "month=$(expr `date +%m` + 0)"

SEMESTER="Winter"
if [[ $month -gt 8 ]]
then
   SEMESTER=Fall
fi

# clipboard operations
alias cbc='wl-copy'
alias cbp='wl-paste'

alias d='sudo docker'
alias d-c='sudo docker-compose'

# a macro to reach current years sideproject folder (by appending current yr to end of this cd command)
alias sp='cd ~/Documents/sideprojects/'$year

function school() {
        if [ $SEMESTER == "Winter" ]
	then 
	    course=~/Documents/school/$((year-1))-$year/$SEMESTER
	else
	    course=~/Documents/school/$year-$((year+1))/$SEMESTER
	fi
	if [[ $# -eq 1 ]]
	then
		course=$course/${1^^}
	fi
	cd $course
}


alias lid-stop='systemd-inhibit --what=handle-lid-switch snooze'

# this shortcut will combine all pdfs in the current directory into one file
# the order will be oldest first; USAGE: pdf-dir <output file name>
alias pdf-dir='pdftk `ls -rtbxw0` cat output'

# equivalent to opening in libreoffice and exporting as a pdf. Use to do bulk doc to pdf conversion in a directory like doc-to-pdf *.docx
alias doc-to-pdf="lowriter --convert-to pdf"

HISTSIZE=100000
HISTFILESIZE=100000

shopt -s histappend

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

# Created by `pipx` on 2024-07-31 01:33:19
export PATH="$PATH:/home/martin/.local/bin"

function extract_frames() {
  if [[ $# -eq 1 ]]
  then
    echo "USAGE: extract_frames <filepath to search>"
    return 1
  fi
  for file in $1
  do
    ffmpeg -i $file -r 0.015 ~/Documents/skunks/$file\_%04d.png
  done
}

# add the following environment variables to your bash config (e.g., ~/.bashrc)
# the editor defined in KITTY_SCROLLBACK_VISUAL will be used in place of VISUAL
# for other scenarios that are not editing the command-line. For example, C-xC-e
# will edit the current command-line in kitty-scrollback.nvim and pressing v in
# less will open the file in $KITTY_SCROLLBACK_VISUAL (defaults to nvim if not
# defined)
export KITTY_SCROLLBACK_VISUAL='nvim'
export VISUAL='/home/martin/.local/share/nvim/site/pack/mikesmithgh/start/kitty-scrollback.nvim/scripts/edit_command_line.bash'
# [optional] pass arguments to kitty-scrollback.nvim in command-line editing mode
# by using the environment variable KITTY_SCROLLBACK_NVIM_EDIT_ARGS
# export KITTY_SCROLLBACK_NVIM_EDIT_ARGS=''
