#!/bin/zsh

# Disable history and sessions in ZSH
SAVEHIST=0
HISTSIZE=0

# ZSH prompt
autoload -Uz vcs_info
precmd() { vcs_info }

# show git branch name in prompt
zstyle ':vcs_info:git:*' formats '%F{#fab387}%f %F{green}%b%f '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}%F{red}❯%f%F{blue}❯%f%F{green}❯%f '

# set vim as default editor
export EDITOR="vim"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise
eval "$(mise activate zsh)"

# postgresql
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# cleanup zsh_history
alias cleanup="clear && truncate -s 0 ~/.zsh_history"

# make ls output colourful by default
alias ls="ls -G"

# start a ruby http server on port 8000
# requires webrick 'gem install webrick'
alias server="ruby -run -e httpd . -p 8000"

# Enable frozen string literals for ruby by default
export RUBYOPT='--enable-frozen-string-literal'

# rails aliases
alias rs="./bin/dev"
alias rc="rails console"
alias rlc="rails log:clear"
alias rn="rails notes"
alias cop="rubocop"
alias audit="bundle-audit check --update && brakeman"
alias devlog='tail -f log/development.log'

# git aliases
alias gst="git status"
alias ga='git add'
alias gapa='git add --patch'
alias gc='git commit --verbose'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdw='git diff --word-diff'
alias glgg='git log --graph --decorate --all'
alias gp='git push'
alias grh='git reset'
alias grhh='git reset --hard'
alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'
