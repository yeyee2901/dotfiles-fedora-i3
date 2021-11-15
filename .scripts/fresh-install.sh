#!/usr/bin/bash

# For Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install the software lists
/usr/bin/cat install-list.txt | xargs -n1 -I {} sudo dnf install -y {}

# Install Oh-my-zsh
# run: 
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o $HOME/ohmyzsh-install.sh
chmod +x $HOME/ohmyzsh-install.sh

# ZSH syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Install rust things
# Rust toolchain
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# cargo install exa bat

chmod +x $HOME/.scripts/lsp-install.sh
$HOME/.scripts/lsp-install.sh
