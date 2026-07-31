# ~/.bashrc — owned by github.com/ArthurAsenheimer/dotfiles
[[ $- != *i* ]] && return

HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
shopt -s histappend checkwinsize globstar 2>/dev/null

# fallback prompt (a themed prompt may take over via ~/.shell_local)
PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '

# bash completion
if ! shopt -oq posix; then
  [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi

# shared topic files
for f in "$HOME"/.config/shell/*.sh; do
  [ -r "$f" ] && . "$f"
done

# machine-local glue (PATH, tool inits, private env) — written by bootstrap, never by this repo
[ -f "$HOME/.shell_local" ] && . "$HOME/.shell_local"
