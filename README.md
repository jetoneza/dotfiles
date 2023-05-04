## Installation

* Clone repository.

```
cd ~
git clone git@github.com:jetoneza/cnfgx.git .dotfiles
cd .dotfiles
git filter-branch --prune-empty --subdirectory-filter dotfiles/ HEAD
```

### NeoVim Setup

* Create symbolic links to neovim files.

```
ln -s .dotfiles/neovim ~/.config/vim
```

### ZSH Setup

* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* Create symbolic link to zshrc.

```
ln -s .dotfiles/zshrc .zshrc
```
