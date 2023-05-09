## Installation

* Clone repository.

```
cd ~
git clone git@github.com:jetoneza/dotfiles.git .dotfiles
cd .dotfiles
```

### Install Nerd fonts
https://www.nerdfonts.com/font-downloads

* Used `MesloLGMDZ Nerd Font Mono` for alacritty.
* `nvim-tree` also requires a Nerd font to display icons.

### Symbolic links

* Create symbolic links to configurations.

#### NeoVim
```
ln -s .dotfiles/neovim ~/.config/nvim
```

#### ZSH
* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* Create symbolic link to zshrc.
```
ln -s .dotfiles/zshrc .zshrc
```
* Install [starship](https://starship.rs/).

#### Tmux
```
ln -s .dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

#### Alacritty
```
ln -s .dotfiles/alacritty ~/.config/alacritty
```
### Git aliases
* Open `/git/config` file and copy alias to `~/.gitconfig`
