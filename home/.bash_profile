#!/usr/bin/env bash
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Environment variables

# Path
export PATH="$PATH:/home/lucva/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
export PATH="$PATH:$HOME/.local/bin"

# XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export GEODE_SDK=/home/lucva/Documents/Geode

# Default Programs
export PAGER=/usr/bin/less
export EDITOR=micro
export VISUAL=micro
export BROWSER=firefox-developer-edition
