# dotfiles
Brewfile and config files for vim, ghostty, etc.

### Setup macos

Install command line tools

    xcode-select install

Set hostname

    sudo scutil --set HostName ‘pirate’

Clone dotfiles repo

    git clone git@github.com:jagira/dotfiles.git ~/dotfiles
    cd dotfiles

Create config directory

    mkdir -p ~/.config

Install homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install brew packages

    brew bundle

#### zsh

Remove .zshrc

    rm ~/.zshrc

Link zshrc

    ln -s ~/dotfiles/zshrc ~/.zshrc

#### git

    git config --global color.ui true
    git config --global user.name "Jigar Patel"
    git config --global user.email "jagira@gmail.com"

#### ghostty

Remove existing config if present

    rm ~/.config/ghostty/config

Create ~/.config/ghostty directory if not present

    mkdir -p ~/.config/ghostty

Link config

    ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config

#### vim

Remove .vimrc

    rm ~/.vimrc

Remove ~/.vim directory

    rm -rf ~/.vim

Link vimrc

    ln -s ~/dotfiles/vimrc ~/.vimrc

Launch vim
