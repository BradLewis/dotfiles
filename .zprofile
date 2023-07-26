export PATH="/opt/homebrew/bin:$PATH"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export PROJECT_HOME=$HOME/repos  
export WORKON_HOME=$HOME/.virtualenvs/
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
