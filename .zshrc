if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH="/opt/homebrew/bin:$PATH"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
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
	zsh-nvm
	zsh-cargo-completion
	golang
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

SECRETS_FILE="$HOME/.secrets.sh"
if [ -f $SECRETS_FILE ]; then
  source $SECRETS_FILE
fi

alias nvim-lazy="NVIM_APPNAME=lazyvim nvim"
alias nvim-kickstart="NVIM_APPNAME=kickstartnvim nvim"
alias nvim-new="NVIM_APPNAME=nvim-new nvim"

function nvims() {
  items=("default kickstartnvim lazyvim")
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

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

source $HOME/.zsh_aliases
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
