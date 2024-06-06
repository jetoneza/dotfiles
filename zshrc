#                                                                                                             
#         88                                                                                                  
#         88                ,d                                                                                
#         88                88                                                                                
#         88   ,adPPYba,  MM88MMM  8b,dPPYba,   ,adPPYba,    ,adPPYba,   8b,dPPYba,    ,adPPYba,  8b,dPPYba,  
#         88  a8P_____88    88     88P'   "Y8  a8"     "8a  a8"     "8a  88P'    "8a  a8P_____88  88P'   "Y8  
#         88  8PP"""""""    88     88          8b       d8  8b       d8  88       d8  8PP"""""""  88          
# 88,   ,d88  "8b,   ,aa    88,    88          "8a,   ,a8"  "8a,   ,a8"  88b,   ,a8"  "8b,   ,aa  88          
#  "Y8888P"    `"Ybbd8"'    "Y888  88           `"YbbdP"'    `"YbbdP"'   88`YbbdP"'    `"Ybbd8"'  88          
#                                                                        88                                   
#                                                                        88                                   
#  
# Jethro Ordaneza
# https://www.jetordaneza.com/, https://github.com/jetoneza/, https://www.youtube.com/@jetrooper_gaming/

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
plugins=(git zsh-autosuggestions)

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

gch() {
  echo $fg[green]"  Git Commit Formats:\n"$reset_color
  echo "  <type>[optional scope]: <description>"
  echo "  [optional body]"
  echo "  [optional footer(s)]\n"
  echo $fg[green]"     build:${reset_color} Changes related to build processes or tools."
  echo $fg[green]"     chore:${reset_color} Regular maintenance or administrative tasks."
  echo $fg[green]"        ci:${reset_color} Updates to the continuous integration setup."
  echo $fg[green]"      docs:${reset_color} Documentation-related changes."
  echo $fg[green]"     style:${reset_color} Changes that do not affect the code’s functionality (e.g., formatting)."
  echo $fg[green]"  refactor:${reset_color} Code modifications without changing its behavior."
  echo $fg[green]"      perf:${reset_color} Performance improvements."
  echo $fg[green]"      test:${reset_color} Adding or modifying tests.\n"
  echo "  Example:\n"
  echo $fg[green]"  feat(homepage):${reset_color} Add carousel feature to showcase testimonials\n"
  echo "  Implemented a carousel component on the homepage"
  echo "  Added client testimonials section for improved user engagement\n"
  echo "  Fixes $fg[red]#12"
}

# ------------------------------------------
# SSH
# ------------------------------------------
alias sshkey="cat ~/.ssh/id_ed25519.pub | pbcopy"

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
# ------------------------------------------
alias hi3='echo "$(<~/.dotfiles/i3/help.md)"'

# ------------------------------------------
# STARSHIP
# ------------------------------------------
eval "$(starship init zsh)"

# ------------------------------------------
# Fast Node Manager
# ------------------------------------------
eval "$(fnm env --use-on-cd)"

# ------------------------------------------
# Go aliases
# ------------------------------------------
export PATH="$PATH:$(go env GOPATH)/bin"

alias gomodvendor="go mod verify && go mod tidy && go mod vendor"
alias air='$(go env GOPATH)/bin/air'

# ------------------------------------------
# PNPM
# ------------------------------------------
export PNPM_HOME="/opt/homebrew/bin/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ------------------------------------------
# NPM
# ------------------------------------------
export NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')
