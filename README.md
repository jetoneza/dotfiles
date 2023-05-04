## Installation

* Clone repository.

```
cd ~
git clone git@github.com:jetoneza/cnfgx.git .dotfiles
cd .dotfiles
git filter-branch --prune-empty --subdirectory-filter dotfiles/ HEAD
```

### Symbolic links

* Create symbolic links to configurations.

# NeoVim
```
ln -s .dotfiles/neovim ~/.config/nvim
```

# ZSH 
* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* Create symbolic link to zshrc.
```
ln -s .dotfiles/zshrc .zshrc
```

# Tmux
```
ln -s .dotfiles/tmux/.tmux.conf ~/.tmux.conf
```
