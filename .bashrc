# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --exclude-dir=logs --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH=/opt/ActivePython-2.7/bin:$PATH

alias agi='sudo apt-get install'
alias runserver='./manage.py runserver --settings=$DJANGO_SETTINGS_MODULE'
alias shell='./manage.py shell --settings=$DJANGO_SETTINGS_MODULE'

# This will do a speaker test for the HDMI source so that you can use it
# to output audio if device is not showing up in settings.
# After running it for a while stop it and the device should then be listed.
alias hdmi-audio='speaker-test -c 2 -r 48000 -D hw:0,3'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

cd /home/austin/development/clincard/clincard/src/greenphire/web/
export S=/home/austin/development/clincard/clincard/src/greenphire/web/
export T=/home/austin/development/clincard/clincard/templates
export C=/home/austin/development/clincard/clincard/scripts/
export G=/home/austin/development/clincard/clincard
source /home/austin/development/virtual_environments/clincard/bin/activate
alias grep='grep -rn'
alias ack='ack-grep'
alias salix='cd ~/development/salix; source ~/development/salix_processing/bin/activate'
alias clin='cd $S; source ~/development/virtual_environments/clincard/bin/activate'
alias bb='deactivate; source ~/development/virtual_environments/bbbsliny/bin/activate; cd ~/bbbsliny/bbbsliny/bbbsliny'
alias rose='deactivate; source ~/development/virtual_environments/rosemont/bin/activate; cd ~/development/rosemont'
export GREP_OPTIONS='--color=always'
export GREP_OPTIONS='--color=always'

# Map the caps lock key to the escape key
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# PEP 370 PATH added by PyPM on 2012-12-17 14:02:48.167799
#export PATH=/home/austin/.local/bin:$PATH


WORK_DIR=/tmp
