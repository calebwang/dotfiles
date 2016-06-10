export CLICOLOR=1

alias tmuxn='tmux new-session -s $$'
alias ffs='sudo "$(history -p !!)"'


today=$(date +%Y)/$(date +%m)/$(date +%d)
now=$(date +%H):$(date +%M):$(date +%S)

mkdir -p ~/.logs/$today

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/'$today'/bash-history.log; fi'
export PS_GIT_BRANCH="\$(git branch 2>/dev/null |grep '* ' |cut -d' ' -f2-)"
export PS1="\\[\[\e[0;32m\u \[\e[0;36m\w \[\e[0;37m\t \[\e[0;35m[$PS_GIT_BRANCH]\n\[\e[0;37m\]$ "
export EDITOR=vim

function logz {
	cd ~/.logs/$today
}

function rlog {
  tr -cd '\11\12\33\40-\176' < $1 | less -R
}


function tabname {
  printf "\e]1;$1\a"
}

_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT
if ! { [ "$TERM" = "screen" ]; } then
    tmuxn
fi

if { [ "$TERM" = "screen" ]; } then
	session_name=$(tmux display-message -p '#S')
	log_name=~/.logs/$today/tmux-$session_name-$now.log
	tmux pipe-pane -o "exec cat >>$log_name"
fi
