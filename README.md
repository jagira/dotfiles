# dotfiles
Brewfile and config files for vim, ghostty, etc.

### Setup macos

Install command line tools

    xcode-select --install

Add xcode.app so that "Developer" option can be unchecked from Spotlight

    touch /Applications/xcode.app

Set hostname

    sudo scutil --set HostName pirate

Clone dotfiles repo

    git clone https://github.com/jagira/dotfiles.git ~/dotfiles
    cd dotfiles
    git remote set-url origin git@github.com:jagira/dotfiles.git

Install homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install brew packages

    brew bundle

Create config directory

    mkdir -p ~/.config

#### zsh

Remove .zshrc

    rm -rf ~/.zshrc

Link zshrc

    ln -s ~/dotfiles/zshrc ~/.zshrc

#### git

Remove existing .gitconfig

    rm -rf ~/.gitconfig

Link gitconfig

    ln -s ~/dotfiles/gitconfig ~/.gitconfig

#### ghostty

Remove existing config if present

    rm -rf ~/.config/ghostty/config

Create ~/.config/ghostty directory if not present

    mkdir -p ~/.config/ghostty

Link config

    ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config

#### vim

Remove .vimrc

    rm -rf ~/.vimrc

Remove ~/.vim directory

    rm -rf ~/.vim

Link vimrc

    ln -s ~/dotfiles/vimrc ~/.vimrc

Launch vim

#### zed

Remove existing zed settings if present

    rm -rf ~/.config/zed/settings.json

Create ~/.config/zed directory if not present

    mkdir -p ~/.config/zed

Link settings.json

    ln -s ~/dotfiles/zed/settings.json ~/.config/zed/settings.json

#### ruby

Install ruby via mise (replace version)

    mise use -g ruby@VERSION

Enable idiomatic version file reading for ruby

    mise settings add idiomatic_version_file_enable_tools ruby
