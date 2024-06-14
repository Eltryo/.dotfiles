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


# Added by Toolbox App
export PATH="$PATH:/home/david/.local/share/JetBrains/Toolbox/scripts"

# additional environment variables
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
#export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/eclipse/lombok.jar"
unset JDTLS_JVM_ARGS

#export GO111MODULE=off
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GOBIN="$GOPATH/bin"

# additional paths
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$HOME/.local/share/nvim/mason/packages/jdtls"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:/home/david/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:/home/david/Android/Sdk/emulator"
export PATH="$PATH:/home/david/flutter/bin"
export PATH="$PATH:/home/david/scripts"
export PATH="$PATH:/home/david/arduino"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:/opt/nvim/"

PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
export PATH

# additional aliases
alias "gitl"="git log --oneline --graph --all"
alias "ohmvpn"="sudo openconnect --disable-ipv6 --protocol=gp -u merklda91755 vpn.ohmportal.de"
alias "bluecon"="bluetoothctl connect 5C:56:A4:88:1F:C6"
alias "bluedis"="bluetoothctl disconnect"
alias "hw"="nmcli c up uuid 5235dfab-a387-45b2-86c8-9b4316fd6995"
alias "config"='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias "nextsync"="~/.local/bin/Nextcloud-3.13.0-x86_64.AppImage"
