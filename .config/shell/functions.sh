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
