
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Window
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

PS1=""
PS1=$PS1'\[\033[1;37m\]┬\[\033[00m\](\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\])'
PS1=$PS1'—($(if [[ $? = 0 ]]; then echo "\[\033[0;32m\]✓"; else echo "\[\033[0;31m\]×"; fi)\[\033[00m\])\n'
PS1=$PS1'\[\033[1;37m\]└\[\033[00m\]\[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# correct path
shopt -sq cdspell