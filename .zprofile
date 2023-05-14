export PATH="/opt/homebrew/bin:$PATH"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:/opt/homebrew/opt/python@3.9/libexec/bin
export PATH=$PATH:$HOME/dotnet
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init --path)"

export PROJECT_HOME=$HOME/repos
export WORKON_HOME=$HOME/.virtualenvs

export DYLD_FRAMEWORK_PATH=/Applications/Xcode.app/Contents/SharedFrameworks

export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
export CHROME_PATH="/Applications/Chromium.app/Contents/MacOS/Chromium"
