# lazyload

if [ `uname` = 'Darwin' ]; then
  function rbenv() {
    unset -f rbenv
    eval "$(rbenv init - --no-rehash)"
    rbenv "$@"
  }

  function pyenv() {
    unset -f pyenv
    eval "$(pyenv init - --no-rehash)"
    eval "$(pyenv virtualenv-init - --no-rehash)"
    pyenv "$@"
  }

  function nodenv() {
    unset -f nodenv
    eval "$(nodevn init - --no-rehash)"
    nodenv "$@"
  }

  function goenv() {
    unset -f goenv
    eval "$(goenv init - --no-rehash)"
    goenv "$@"
  }
fi

