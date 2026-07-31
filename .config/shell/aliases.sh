# aliases — shared by bash & zsh; graceful fallbacks when a tool is missing
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first'
  alias ll='eza -la --group-directories-first --git'
  alias lt='eza --tree --level=2'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
fi

command -v batcat >/dev/null 2>&1 && alias bat='batcat'
command -v fdfind >/dev/null 2>&1 && alias fd='fdfind'

alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
