# Prompt
autoload -U colors && colors
setopt prompt_subst

# --- Function to build git block ---
git_prompt() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]]; then
    local git_status branch_name bg_color fg_color marker

    branch_name="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    git_status="$(git status --porcelain 2>/dev/null)"

    if [[ -n "$git_status" ]]; then
      bg_color="yellow"
      fg_color="black"
      marker=" ±"
    else
      bg_color="green"
      fg_color="black"
      marker=""
    fi

    # Git block
    echo "%F{blue}%K{$bg_color}%F{$fg_color}  ${branch_name}${marker} %k%f"
  fi
}

# prompt with path and git blocks
PROMPT='%K{blue}%F{black} %~ %k$(git_prompt)'  # path + optional git block
PROMPT+=$'\n'
PROMPT+='%F{green}➜ %f'

# Editor
EDITOR='vim'
VISUAL='mate'

# Aliases
# --- rails
alias rc="rails console"
alias rs="./bin/dev"
alias rlc="rails log:clear"
alias devlog="tail -f log/development.log"

# --- git
alias gst='git status'
alias glgg='git log --graph --decorate --all'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias grh='git reset'
alias grhh='git reset --hard'
alias ga='git add'
alias gapa='git add --patch'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'

# --- custom aliases
alias cleanup="clear && truncate -s 0 ~/.zsh_history"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Mise
eval "$(/Users/jagira/.local/bin/mise activate zsh)" # added by https://mise.run/zsh

# Postgresql
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
