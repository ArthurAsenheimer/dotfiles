# environment — shared by bash & zsh
command -v micro >/dev/null 2>&1 && export EDITOR=micro VISUAL=micro
export LESS='-R -F'
export PAGER=less
