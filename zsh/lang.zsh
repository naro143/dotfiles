# lazyload

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

if [ `uname` = 'Darwin' ]; then
  function rbenv() {
    unfunction "$0"
    eval "$(rbenv init - --no-rehash)"
    $0 "$@"
  }

  function pyenv() {
    unfunction "$0"
    eval "$(pyenv init - --no-rehash)"
    $0 "$@"
  }

  function nodenv() {
    unfunction "$0"
    eval "$(nodenv init - --no-rehash)"
    $0 "$@"
  }

  function goenv() {
    unset -f goenv
    eval "$(goenv init - --no-rehash)"
    goenv "$@"
  }
fi
