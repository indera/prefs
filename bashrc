[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/aliases ] && . ~/aliases

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[1;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "(branch: $branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "(commit: $commit)"
  fi
}

# set prompt style
#PS1='\[\033[01;32m\]\u@mac \[\033[01;34m\]\w \$ \[\033[00m\]'
PS1="\[\$(git_color)\]"                     # colors git status
PS1+="\$(git_branch)\n"                        # prints current branch
PS1+="\[$COLOR_BLUE\]\u@mac [\w]"           # basename of pwd
PS1+="\[$COLOR_GREEN\]\$ \[$COLOR_WHITE\]"    # '#' for root, else '$'
export PS1
declare -x PS1

export MYSQL_PS1="(\u@\h) [\d]> "
export EDITOR=/usr/bin/vim
export LANG=en_US.utf-8
export LC_ALL=C
export GREP_OPTIONS='--color=auto -n'
#export GREP_COLOR='1;32'

# F - quit if line fits
# S - chop long lines instead of folding
# X - no init (avoid clear screen when closing)
export LESS="-I -R -M  -FSX --shift=5"
export HISTCONTROL=ignoredups
export HISTSIZE=99999999
export HISTFILESIZE=99999999

fortune

