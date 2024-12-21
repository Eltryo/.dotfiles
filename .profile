# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Bitwarden api keys
export BW_CLIENTID=user.ed60c9b9-3069-46ad-adf8-af9201662488
export BW_CLIENTSECRET=xgpaWWlYZag4RTiIMmXs7Clp8SMT63 

# Added by Toolbox App
export PATH="$PATH:/home/david/.local/share/JetBrains/Toolbox/scripts"

# additional environment variables
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

# additional paths
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$HOME/.local/share/nvim/mason/packages/jdtls"
export PATH="$PATH:/home/david/Android/Sdk/emulator"
export PATH="$PATH:/home/david/flutter/bin"
export PATH="$PATH:/home/david/arduino"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:/opt/nvim/"

PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
export PATH
