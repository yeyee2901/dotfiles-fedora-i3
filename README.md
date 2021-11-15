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
