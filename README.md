# dotfiles
Brewfile and config files for vim, ghostty, etc.

Clone dotfiles repo

    git clone git@github.com:jagira/dotfiles.git ~/dotfiles
    cd dotfiles

### Create config directory

    mkdir -p ~/.config

### Setup macos

Install command line tools

    xcode-select install

Install homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install brew packages

    brew bundle

Setup git

    git config --global color.ui true
    git config --global user.name "Jigar Patel"
    git config --global user.email "jagira@gmail.com"

### Ghostty

Remove existing config if present

    rm ~/.config/ghostty/config

Create ~/.config/ghostty directory if not present

    mkdir -p ~/.config/ghostty

Link config

    ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config

### zsh

Remove .zshrc

    rm ~/.zshrc

Link zshrc

    ln -s ~/dotfiles/zshrc ~/.zshrc

### vim

Remove .vimrc

    rm ~/.vimrc

Remove ~/.vim directory

    rm -rf ~/.vim

Link vimrc

    ln -s ~/dotfiles/vimrc ~/.vimrc

Launch vim
