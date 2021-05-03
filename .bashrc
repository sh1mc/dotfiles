#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# export DISPLAY='localhost:10.0'

export PATH=$PATH:~/.gem/ruby/2.7.0/bin
export PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-linux
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:/var/lib/snapd/snap/bin

if [ -e $HOME/.bashrc_local ]; then
	source $HOME/.bashrc_local;
fi

exec fish
