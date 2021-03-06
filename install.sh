#!/bin/bash

APP_NAME='vegaVIM'
REQUIRE="npm node git"
NVIM_COMMAND="$(which nvim)"
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

checkenv() {
    if ! command -v node>/dev/null; then
        error 'nodejs is not installed'
        exit 1
    fi

    if ! command -v npm>/dev/null; then
        error 'npm is not installed'
        exit 1
    fi 

    if ! command -v tsc>/dev/null; then
        error 'typescript is not installed globally'
        exit 1
    fi

    if ! command -v python>/dev/null; then
        error 'python2 is not installed'
        exit 1
    fi 

    if ! command -v python3>/dev/null; then
        error 'python3 is not installed'
        exit 1
    fi

    if [[ ! $NVIM_COMMAND ]]; then
        if [[ -s $HOME/bin/nvim ]]; then
            NVIM_COMMAND="$HOME/bin/nvim"
        else 
            error "Command nvim is not found. Please make sure neovim was installed!"
        fi
    fi

}


checkenv

if [ ! -e "$VIM_PATH" ]; then
    info "clone vegaVIM to $VIM_PATH"
    mkdir -p "$VIM_PATH"
    git clone "$REPO_URI" "$VIM_PATH"
    ret="$?"
    success "Successfully cloned $APP_NAME"
else 
    info "update vegaVIM in $VIM_PATH"
    cd "$VIM_PATH" && git pull origin
    ret="$?"
    success "Successfully updated $APP_NAME"
fi

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

info "update/install plugins by vim-plug"
$NVIM_COMMAND +PlugInstall! +PlugClean +UpdateRemotePlugins +qall! ""
info "update/install coc extensions by coc.nvim"
ln -sf $VIM_PATH/coc $HOME/.config/coc # 忘了干嘛用了
$NVIM_COMMAND +CocInstall +CocUpdateSync +qall! ""


