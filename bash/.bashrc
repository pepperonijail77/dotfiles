#!/usr/bin/env bash

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ $- == *i* ]]; then bind "set completion-ignore-case on"; fi

# Set the default editor
export EDITOR=micro
export VISUAL=micro
alias mic='micro'
alias smic='sudo micro'
alias vim='nvim'
alias vi='nvim'
alias vis='nvim "+set si"'
alias spico='sudo pico'
alias snano='sudo nano'
alias smicro='sudo micro'

# Python alias
alias py='python3'
alias python='python3'
alias pip='pip3'

# Activate python virtual environment
function activate {
	if [ -d .venv ]; then
		source .venv/bin/activate
	elif [ -d .qtcreator ]; then
		source .qtcreator/Python_*venv/bin/activate
	fi
}

# alias activate='source .venv/bin/activate'

# Set the default browser
export BROWSER=firefox-developer-edition

# To have colors for ls and grep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
alias ls='ls -Ah --color=auto'
alias grep='grep --color=auto'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# aliases to modified commands
alias cp='cp -i'
alias mv='mv -i'
if command -v trash &> /dev/null; then
    alias rm='trash -v'
else
    alias rm='rm -i'  # fallback to interactive remove
fi
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias less='less -R'
alias cls='clear'
alias pac='sudo pacman'
alias pacman='sudo pacman'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias ll='ls -Alh --color=auto'
alias tree='tree -CAh --dirsfirst'

alias yays='yay -Slq | fzf --multi --preview '\''yay -Sii {1}'\'' --preview-window=down:75% | xargs -ro yay -S'
alias ll='ls -Fls'

# Change directory aliases
alias cd..='cd ..'
alias ..='cd ..'

# Extracts any archive(s) (if unp isn't installed)
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf "$archive" ;;
			*.tar.gz) tar xvzf "$archive" ;;
			*.bz2) bunzip2 "$archive" ;;
			*.rar) rar x "$archive" ;;
			*.gz) gunzip "$archive" ;;
			*.tar) tar xvf "$archive" ;;
			*.tbz2) tar xvjf "$archive" ;;
			*.tgz) tar xvzf "$archive" ;;
			*.zip) unzip "$archive" ;;
			*.Z) uncompress "$archive" ;;
			*.7z) 7z x "$archive" ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# IP address lookup
alias ipaddress='curl -4 ifconfig.me; echo'

# bind "set bell-style visible"

# Bash prompt
#PS1='[\u@\h \W]\$ '
PS1='[\[\e[34m\]\u@\h \[\e[94;1m\]\W\[\e[0m\]]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
