# -----------------------------------
#  ZSH Configuration
# -----------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME=""

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ------------------------------------
# EXPORT PATHS
# ------------------------------------

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# ------------------------------------------
# CUSTOM ALIASES
# ------------------------------------------

alias root="cd ~/"

# Tmux
function tmuxinit() {
  # Neofetch 
  tmux new-session -s genesis -d
  tmux send-keys -t genesis "neofetch" Enter
  tmux attach -t genesis
}
alias tx=tmuxinit
alias ta="tmux a"
if [ "$TMUX" = "" ]; then tx; fi

# ------------------------------------------
# ZSH
# ------------------------------------------
alias ebash="sudo nvim ~/.zshrc"
alias sbash=". ~/.zshrc"

# ------------------------------------------
# GIT
# ------------------------------------------
alias gits="git status"
alias gitf="git fetch origin"

gitrebase() { git rebase origin/$1; }
alias gitr=gitrebase

gitpush() { git push origin $1; }
alias gitp=gitpush

gitshort() {
  gits;
  gitf;
  gitr master;
}
alias gitx=gitshort

# ------------------------------------------
# SSH
# ------------------------------------------
alias sshkey="cat ~/.ssh/id_ed25519.pub | pbcopy"

# ------------------------------------------
# SANDBOX
# ------------------------------------------
# Go to sandbox folder
sandbox() {
  cd /mnt/c/Users/Jetrooper/Documents/Programming/sandbox
}

alias sbox=sandbox

# ------------------------------------------
# LS Shortcuts
# ------------------------------------------
alias lsf="ls -GHf"
alias ls="ls -GFh"
alias ll="ls -l"
alias la="ls -la"

# ------------------------------------------
# Process
# ------------------------------------------
killport() {
  echo "${GREEN}sudo lsof -i tcp:${1}${NORMAL}"
  echo "${RED}kill -9 PID ${NORMAL}"
}

# ------------------------------------------
# NODE
# ------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Switch NodeJS version
cd () { builtin cd "$@" && chNodeVersion;  }
pushd () { builtin pushd "$@" && chNodeVersion;  }
popd () { builtin popd "$@" && chNodeVersion;  }

chNodeVersion() {
 # Use the NodeJS version specified in the file, if present
 if [ -f ".nvmrc"  ] ; then
    nvm use;
 fi
}
chNodeVersion;

# ------------------------------------------
# WSL2
# ------------------------------------------
if ! [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# ------------------------------------------
# HELP DOCS for i3
 ------------------------------------------
alias hi3='echo "$(<~/.dotfiles/i3/help.md)"'

# ------------------------------------------
# STARSHIP
# ------------------------------------------
eval "$(starship init zsh)"

