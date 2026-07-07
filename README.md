# dotfiles
Brewfile and config files for vim, ghostty, etc.

### Quick setup

Install command line tools for Xcode

    xcode-select --install

For quicker install, go to Apple's Developer [portal](https://developer.apple.com/download/all/), login with Apple ID, download `Command Line Tools for Xcode` package, and install it.

Clone dotfiles repo

    git clone https://github.com/jagira/dotfiles.git ~/dotfiles

Set remote URL

    cd ~/dotfiles && git remote set-url origin git@github.com:jagira/dotfiles.git

Run install script

    bash ~/dotfiles/install.sh

The script will walk through macOS setup, Homebrew, config symlinks, Ruby, and SSH key generation. Each step is idempotent — safe to re-run if something fails partway through.

---

### Manual setup

Follow the steps below if you prefer to run each part individually, or need to troubleshoot a specific section.

#### macos

Install command line tools for Xcode

    xcode-select --install

For quicker install, go to Apple's Developer [portal](https://developer.apple.com/download/all/), login with Apple ID, download `Command Line Tools for Xcode` package, and install it.

Add xcode.app so that "Developer" option can be unchecked from Spotlight

    touch /Applications/xcode.app

Set hostname

    sudo scutil --set HostName pirate

#### homebrew

Install homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Restart terminal or open new terminal tab.

Turn off brew analytics

    brew analytics off

Install brew packages

    brew bundle --verbose

#### symlinks

Create config directory

    mkdir -p ~/.config

##### zsh

Remove existing .zshrc

    rm -rf ~/.zshrc

Link zshrc

    ln -s ~/dotfiles/zshrc ~/.zshrc

##### git

Remove existing .gitconfig

    rm -rf ~/.gitconfig

Link gitconfig

    ln -s ~/dotfiles/gitconfig ~/.gitconfig

##### ghostty

Remove existing ghostty config

    rm -rf ~/.config/ghostty/config

Create ~/.config/ghostty directory

    mkdir -p ~/.config/ghostty

Link ghostty config

    ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config

##### vim

Remove .vimrc

    rm -rf ~/.vimrc

Remove ~/.vim directory

    rm -rf ~/.vim

Link .vimrc

    ln -s ~/dotfiles/vimrc ~/.vimrc

Launch vim

##### zed

Remove existing zed settings

    rm -rf ~/.config/zed/settings.json

Create ~/.config/zed directory

    mkdir -p ~/.config/zed

Link settings.json

    ln -s ~/dotfiles/zed/settings.json ~/.config/zed/settings.json

Link keymap.json

    ln -s ~/dotfiles/zed/keymap.json ~/.config/zed/keymap.json

#### ruby

Use precompiled ruby binaries

    mise settings ruby.compile=false

Install ruby via mise (omit version for latest)

    mise use -g ruby@VERSION

Enable idiomatic version file reading for ruby

    mise settings add idiomatic_version_file_enable_tools ruby

#### SSH

Generate new SSH key

    ssh-keygen -t ed25519 -C "jagira@gmail.com"

Start SSH agent in background

    eval "$(ssh-agent -s)"

Copy SSH config

    cp ~/dotfiles/sshconfig ~/.ssh/config

Copy SSH key to clipboard

    pbcopy < ~/.ssh/id_ed25519.pub

---

### Known issues

#### postgresql@18 fails to install with `dict_snowball` error

`initdb` fails during `brew install postgresql@18` with:

    FATAL: could not access file "dict_snowball": No such file or directory

The bottle does not symlink the `lib/postgresql/` subdirectory to the path `pg_config --pkglibdir` reports, so bundled extensions are unreachable. Fix by manually creating the symlink:

    ln -s /opt/homebrew/Cellar/postgresql@18/18.4/lib/postgresql /opt/homebrew/lib/postgresql@18

Then complete the install:

    brew postinstall postgresql@18

This is a brew packaging bug. The same issue may affect postgresql@17 — substitute the version number accordingly.

