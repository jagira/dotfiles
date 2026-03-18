# dotfiles
Brewfile and config files for vim, ghostty, etc.

### Setup macos

Install command line tools for Xcode

    xcode-select --install

For quicker install, go to Apple's Developer [portal](https://developer.apple.com/download/all/), login with Apple ID, download `Command Line Tools for Xcode` package, and install it.

Add xcode.app so that "Developer" option can be unchecked from Spotlight

    touch /Applications/xcode.app

Set hostname

    sudo scutil --set HostName pirate

Clone dotfiles repo

    git clone https://github.com/jagira/dotfiles.git ~/dotfiles

Set remote URL

    cd ~/dotfiles && git remote set-url origin git@github.com:jagira/dotfiles.git

Install homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Restart terminal or open new terminal tab.

Install brew packages

    brew bundle --verbose

Create config directory

    mkdir -p ~/.config

#### zsh

Remove existing .zshrc

    rm -rf ~/.zshrc

Link zshrc

    ln -s ~/dotfiles/zshrc ~/.zshrc

#### git

Remove existing .gitconfig

    rm -rf ~/.gitconfig

Link gitconfig

    ln -s ~/dotfiles/gitconfig ~/.gitconfig

#### ghostty

Remove existing ghostty config

    rm -rf ~/.config/ghostty/config

Create ~/.config/ghostty directory

    mkdir -p ~/.config/ghostty

Link ghostty config

    ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config

#### vim

Remove .vimrc

    rm -rf ~/.vimrc

Remove ~/.vim directory

    rm -rf ~/.vim

Link .vimrc

    ln -s ~/dotfiles/vimrc ~/.vimrc

Launch vim

#### zed

Remove existing zed settings

    rm -rf ~/.config/zed/settings.json

Create ~/.config/zed directory

    mkdir -p ~/.config/zed

Link settings.json

    ln -s ~/dotfiles/zed/settings.json ~/.config/zed/settings.json

#### ruby

Use precompiled ruby binaries

    mise settings ruby.compile=false

Install ruby via mise (replace version)

    mise use -g ruby@VERSION

Enable idiomatic version file reading for ruby

    mise settings add idiomatic_version_file_enable_tools ruby

### SSH

Generate new SSH key

    ssh-keygen -t ed25519 -C "jagira@gmail.com"

Start SSH agent in background

    eval "$(ssh-agent -s)"

Copy SSH config

    cp ~/dotfiles/sshconfig ~/.ssh/config
    
Copy SSH key to clipboard

    pbcopy < ~/.ssh/id_ed25519.pub
