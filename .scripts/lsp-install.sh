#!/bin/bash

# Language Servers from NPM registry
npm i -g install \
    bash-language-server \
    diagnostic-languageserver \
    intelephense \
    live-server \
    pyright \
    serve \
    sql-language-server \
    typescript \
    typescript-language-server \
    vim-language-server \
    vscode-langservers-extracted

# Sadly, on fedora, ccls is not available on the registry
# we have to take a roundabout path to SNAP :)
# Disable this if you don't want to use snap
# sudo dnf install snap
# sudo ln -s /var/lib/snapd /usr/bin/snap
# sudo snap install ccls

# Alternative is clangd
