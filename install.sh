#!/usr/bin/env sh

set -e

# Variables

cwd=`pwd`

# Functions

abort() {
    echo "abort: $1" >&2
    exit 1
}

install_brew_libs() {
    cd "$cwd/.dotfiles" && brew bundle
    # tig settings
    cp "$cwd/.tigrc" "$HOME/"
}

install_omz() {
    [ -d "$HOME/.oh-my-zsh" ] && abort "\`~/.oh-my-zsh' already exists!"

    git clone https://github.com/robbyrussell/oh-my-zsh.git ./vendor/oh-my-zsh
    ln -s "$cwd/vendor/oh-my-zsh" "$HOME/.oh-my-zsh"
    ln -s "$cwd/zshrc" "$HOME/.zshrc"
}

set_up_vim() {
    # Requires Git 1.7+ and Vim 7.3+
    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
    # customize settings
    cp "$cwd/vim/.vimrc.before.local" "$HOME/"
    cp "$cwd/vim/.vimrc.bundles.local" "$HOME/"
    cp "$cwd/vim/.vimrc.local" "$HOME/"
    # install plugins
    vim +BundleInstall! +BundleClean +q
}

set_up_tmux() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # type this in terminal
    $ tmux source ~/.tmux.conf
    # Press prefix + I (capital I, as in Install) to fetch the plugin.
}

set_up_thyme() {
    gem install thyme
    cp "$cwd/thyme/.thymerc" "$HOME/"
}

set_up_node() {
    git clone https://github.com/creationix/nvm.git ./vendor/nvm
    # Checkout latest release
    cd ./vendor/nvm && git checkout `git describe --abbrev=0 --tags`
    ln -s "$cwd/vendor/nvm" "$HOME/.nvm"
}

set_up_ruby() {
    ln -s "$cwd/irbrc" "$HOME/.irbrc"
    ln -s "$cwd/pryrc" "$HOME/.pryrc"
}

# Begin installation

install_brew_libs
install_omz
set_up_vim
set_up_tmux
set_up_thyme
set_up_node
set_up_ruby

echo "Installation done!\n"
