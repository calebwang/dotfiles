export CODEZ=~/sandbox/asana # Or wherever you want the git repository to be, but it should end in /asana
export ASANA_GIT_NAME="caleb"
export ASANA_GIT_EMAIL="caleb@asana.com"
export ASANA_ARCH=x64
export MYSQL=mysql5
export CONFIG=sand
export MAC_CONFIGURE_VERSION=2 # only for clean installs
source $CODEZ/admin/mac.bashrc
alias codez="cd $CODEZ"
alias luna2="cd $CODEZ/asana2"

export CLICOLOR=1

export PATH=$PATH:$HOME/bin
export JAVA_HOME="$(/usr/libexec/java_home)"

alias tmuxn='tmux new-session -s $$'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT
if ! { [ "$TERM" = "screen" ]; } then
    tmuxn
fi

export PS1="\\[\[\e[0;32m\u \[\e[0;36m\w \[\e[0;37m\t \[\e[0;35m[$PS_GIT_BRANCH]\n\[\e[0;37m\]$ " 
if [ "${PWD}" != /Users/calebwang/sandbox/asana ]; then
    codez
fi

