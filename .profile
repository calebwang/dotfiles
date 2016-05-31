export CLICOLOR=1

alias tmuxn='tmux new-session -s $$'
alias ffs='sudo "$(history -p !!)"'

_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT
if ! { [ "$TERM" = "screen" ]; } then
    tmuxn
fi

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
export PS_GIT_BRANCH="\$(git branch 2>/dev/null |grep '* ' |cut -d' ' -f2-)"
export PS1="\\[\[\e[0;32m\u \[\e[0;36m\w \[\e[0;37m\t \[\e[0;35m[$PS_GIT_BRANCH]\n\[\e[0;37m\]$ "
export EDITOR=vim


function tabname {
  printf "\e]1;$1\a"
}

