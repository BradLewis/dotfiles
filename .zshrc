if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH="/opt/homebrew/bin:$PATH"

plugins=(
	git
	python
	pip
	zsh-autosuggestions
	colorize
	brew
	tmux
	macos
	zsh-syntax-highlighting
	vscode
	virtualenvwrapper
	docker
	terraform
	colored-man-pages
	dotnet
	zsh-tfenv
	pyenv
	poetry
	rust
	minikube
	kubectl
	helm
  node
  yarn
	nvm
	zsh-cargo-completion
)

source $ZSH/oh-my-zsh.sh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# User configuration

export PATH="$HOME/.poetry/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

SECRETS_FILE="$HOME/.secrets.sh"
if [ -f $SECRETS_FILE ]; then
  source $SECRETS_FILE
fi

alias nvim-ks="NVIM_APPNAME=kickstart nvim"

function nvims() {
  items=("default kickstart")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
