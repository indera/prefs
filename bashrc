[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/aliases ] && . ~/aliases

# set prompt style
PS1='\[\033[01;32m\]\u@mac \[\033[01;34m\]\w \$ \[\033[00m\]'
declare -x PS1
export MYSQL_PS1="(\u@\h) [\d]> "
export EDITOR=/usr/bin/vim
export LANG=en_US.utf-8
fortune

