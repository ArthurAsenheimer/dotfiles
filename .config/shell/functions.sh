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
  local picked key file
  picked=$(fd --type f | fzf --query "$*" --expect=ctrl-e) || return  # Esc keeps fzf's 130
  key=${picked%%$'\n'*}  # fzf prints the pressed --expect key (empty for Enter), then the file
  file=${picked#*$'\n'}
  if command -v wslpath >/dev/null 2>&1; then  # WSL: hand the file to Windows
    file=$(wslpath -w "$file") || return
    [ "$key" = ctrl-e ] && file="/select,$file"
    explorer.exe "$file" || [ $? -eq 1 ]  # explorer.exe exits 1 even on success
  elif [ "$key" = ctrl-e ]; then
    xdg-open "$(dirname "$file")"  # xdg-open can only open the folder, not select the file
  else
    xdg-open "$file"
  fi
}
