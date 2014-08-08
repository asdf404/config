
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
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pl='ps -Al'
alias px='ps aux'

alias gitpl='git pull --rebase'
alias gitad='git add .'
alias gitco='git commit'
alias gitps='git push'
alias gitadco='git add . && git commit'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# @source http://habrahabr.ru/post/165385/#comment_5703755
# usage recdesktop file.mkv
alias recdesktop='ffmpeg -f x11grab -s 1920x1080 -r 8 -i :0.0 -sameq '

# Start VM in headless mode
alias startvm='VBoxManage startvm $1 --type headless'
# Save VM state
alias savevm='VBoxManage controlvm $1 savestate'

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


# command "unpack"
# @see http://habrahabr.ru/post/158271/
unpack ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1    ;;
            *.tar.gz)   tar xvzf $1    ;;
            *.tar.xz)   tar xvJf $1    ;;
            *.bz2)      bunzip2 $1     ;;
            *.rar)      unrar x $1     ;;
            *.gz)       gunzip $1      ;;
            *.tar)      tar xvf $1     ;;
            *.tbz2)     tar xvjf $1    ;;
            *.tgz)      tar xvzf $1    ;;
            *.zip)      unzip $1       ;;
            *.xz)       unxz $1        ;;
            *)          echo "'$1': Unknown method of file compression"  ;;
        esac
        else
            echo "'$1' not found"
    fi
}