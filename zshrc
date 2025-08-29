#!/bin/zsh

# ZSH prompt
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%F{white}%f %F{green}%b%f'

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_} %F{green}❯%f '

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise
eval "$(mise activate zsh)" # added by https://mise.run/zsh

# postgresql
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# cleanup zsh_history
alias cleanup="clear && truncate -s 0 ~/.zsh_history"

# rails aliases
alias rs="./bin/dev"
alias rc="rails console"
alias rlc="rails log:clear"
alias devlog='tail -f log/development.log'

# git aliases
alias gst="git status"
alias ga='git add'
alias gapa='git add --patch'
alias gc='git commit --verbose'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
alias glgg='git log --graph --decorate --all'
alias gp='git push'
alias grh='git reset'
alias grhh='git reset --hard'
