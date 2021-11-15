# Dotfiles Fedora
## Fresh install

1. Cloning the repository
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# to avoid recursiveness
echo "dotfiles" > ~/.gitignore

git clone --bare https://github.com/yeyee2901/dotfiles-fedora-i3.git $HOME/dotfiles
dotfiles checkout

source ~/.alias_envs

dotfiles config --local status.showUntrackedFiles no
```
2. After cloning, restart your terminal so the paths are registered correctly. And then you can run the `fresh-install.sh` script
```bash
chmod +x $HOME/.scripts/lsp-install.sh
chmod +x $HOME/.scripts/fresh-install.sh

$HOME/.scripts/fresh-install.sh
```
3. Also, make sure to check the install scripts in case you want to add something else.

## Features
- **i3** -  window manager
- **rofi** - Program launcher ( Win + Enter )
- **Alacritty** - Terminal with JetBrains Mono Nerd Font ( Win + t )
   - Font JetBrains Mono Nerd Font in ~/.fonts/
- **Tmux** - For terminal session manager, supporting italics
- **polybar** - Customizable status bar
- fresh install script

- EDITOR: **Neovim 0.5.1** :
  - **Packer** - Plugin manager
  - **Color** - Solarized & NeoSolarized (default: neo)
  - **Nvim Tree** - File tree viewer
  - **nvim CMP** - Completion engine
  - **Ultisnips** - Snippet engine
  - **LSP** - For IDE experience, using native LSP (bye coc.nvim)
  - **Treesitter** - for better syntax highlighting
  - **Telescope** - Extendable & customizable fuzzy finder
  - **Distant** - Remote development
