export CLICOLOR=1

alias tmuxn='tmux new-session -s $$'
alias ffs='sudo "$(history -p !!)"'
alias grb='git for-each-ref --count=15 --sort=-authordate:iso8601 refs/heads/ --format='"'"'%(color:yellow)%(HEAD) %(refname:short)'"'"


function today {
    echo $(date +%Y/%m/%d)
}

function now {
    echo $(date +%H:%M:%S)
}

mkdir -p ~/.logs/$(today)

function log_history {
	if [ $(id -u) -ne 0 ]; then
		echo "$(today).$(now) $tmux_log_name $(pwd) $(history 1)" >> ~/.logs/$(today)/bash-history.log;
	fi
}

function update_tmux_log_dir {
	if [ "$TERM" = "screen" ] && [ "$tmux_date" = "$(today)" ]; then
		tmux_log_auto;
	fi
}

function logz {
  cd ~/.logs/$(today)
}

function lessr {
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


function tmux_log() {
	tmux pipe-pane
    tmux_log_name=~/.logs/$(today)/tmux-$1.log
	tmux pipe-pane "exec cat >>$tmux_log_name"
}

function tmux_log_auto {
	mkdir -p ~/.logs/$(today)
    tmux_info=$(tmux display-message -p '#S-#I-#P')
    tmux_name=$(tmux display-message -p '#W')
	tmux_date=$(today)
    tmux_log $tmux_name-$tmux_info
}

export PROMPT_COMMAND='log_history && update_tmux_log_dir'
export PS_GIT_BRANCH="\$(git rev-parse --abbrev-ref HEAD 2>/dev/null | cut -d' ' -f2-)"
export PS1="\\[\[\e[0;32m\u \[\e[0;36m\w \[\e[0;37m\t \[\e[0;35m[$PS_GIT_BRANCH]\n\[\e[0;37m\]$ "
export EDITOR=vim

if { [ "$TERM" = "screen" ]; } then
    tmux_log_auto
fi
