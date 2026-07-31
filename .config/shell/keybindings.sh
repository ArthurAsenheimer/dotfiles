# keybindings — zsh only (bash uses ~/.inputrc)
[ -n "$ZSH_VERSION" ] || return 0

bindkey -e  # emacs mode
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search    # ↑ prefix history search
bindkey '^[[B' down-line-or-beginning-search  # ↓
bindkey '^[[H' beginning-of-line              # Home
bindkey '^[[F' end-of-line                    # End
bindkey '^[[3~' delete-char                   # Delete
