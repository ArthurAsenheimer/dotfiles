# functions — shared by bash & zsh
mkcd() { mkdir -p "$1" && cd "$1" || return; }

extract() {
  case "$1" in
    *.tar.gz|*.tgz) tar xzf "$1" ;;
    *.tar.bz2)      tar xjf "$1" ;;
    *.tar.xz)       tar xJf "$1" ;;
    *.zip)          unzip "$1" ;;
    *.gz)           gunzip "$1" ;;
    *) echo "extract: unknown archive type: $1" >&2; return 1 ;;
  esac
}

# ff [query]: pick a file below the current directory with fzf.
# Enter opens it with the default app, Ctrl-E shows it in the file manager.
ff() {
  local open reveal
  if command -v wslpath >/dev/null 2>&1; then  # WSL: hand the file to Windows
    open='explorer.exe "$(wslpath -w {})"'
    reveal='explorer.exe /select,"$(wslpath -w {})"'
  else
    open='xdg-open {}'
    reveal='xdg-open "$(dirname {})"'  # xdg-open can only open the folder, not select the file
  fi
  fd --type f | fzf --query "$*" \
    --bind "enter:execute-silent($open)+abort" \
    --bind "ctrl-e:execute-silent($reveal)+abort"
}
