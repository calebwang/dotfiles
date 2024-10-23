# NODE
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PYTHON

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

plugin=(
  pyenv
)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# PROMPT

setopt PROMPT_SUBST
export PS_GIT_BRANCH="\$(git rev-parse --abbrev-ref HEAD 2>/dev/null | cut -d' ' -f2-)"
export PROMPT="%F{40}%n%f %F{cyan}%~%f %F{white}%T%f %F{magenta}[$PS_GIT_BRANCH]%f"$'\n'"%F{white}$ "
export EDITOR=vim

# AUTOCOMPLETE

autoload -U compinit && compinit

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward


export PATH="$HOME/code/git-recent-branch-switcher:$PATH"
