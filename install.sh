#!/bin/bash

APP_NAME='vegaVIM'
REQUIRE="npm node git"
[ -z "$VIM_PATH" ] && VIM_PATH="$HOME/.vegaVIM"
[ -z "$REPO_URI" ] && REPO_URI="https://github.com/vegawong/vegaVIM"

# help functions 

msg() {
	printf '%b\n' "$1" >&2
}

success() {
    msg "\33[32m ✔ \33[0m ${1}${2}"
}

error() {
    msg "\33[31m ✘ \33[0m ${1}${2}"
    exit 1
}

warn() {
    msg "\33[33m ⚠ \33[0m ${1}${2}"
}

info() {
    msg "\33[32m ➜ \33[0m ${1}${2}"
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

info "setting up symlinks"
# nvim config path for macOS
lnif $VIM_PATH/ $HOME/.config/nvim


# install vim-plug
if [ ! -e $HOME/.local/share/nvim/site/plugin/plug.vim ]; then
	info "Installing Vim-Plug"
	curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	success "Successfully installed vim-plug"
fi
