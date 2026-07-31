# ~/.zshrc — owned by github.com/ArthurAsenheimer/dotfiles

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt append_history share_history hist_ignore_dups hist_ignore_space
setopt autocd interactive_comments

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case-insensitive completion
zstyle ':completion:*' menu select

# shared topic files
for f in "$HOME"/.config/shell/*.sh; do
  [ -r "$f" ] && . "$f"
done

# machine-local glue (PATH, tool inits, private env) — written by bootstrap, never by this repo
[ -f "$HOME/.shell_local" ] && . "$HOME/.shell_local"
