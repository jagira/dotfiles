# dotfiles
Config files for vim, ghostty, etc.

Clone dotfiles repo

    git clone git@github.com:jagira/dotfiles.git ~/dotfiles
    cd dotfiles

### vim

Remove .vimrc

    rm ~/.vimrc

Remove ~/.vim directory

    rm -rf ~/.vim

Link vimrc

    ln -s ~/dotfiles/vimrc ~/.vimrc

Launch vim

### Ghostty

Remove existing config if present

    rm ~/.config/ghostty/config

Create ~/.config/ghostty directory if not present

    mkdir -p ~/.config/ghostty

Link config

    ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
