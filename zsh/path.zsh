export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.fzf/bin"

case `uname` in
  "Darwin" ) # requires gnu-sed
    # Homebrew
    export PATH="/opt/homebrew/bin:$PATH"

    # andoroid
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/tools/bin"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
    export ANDROID_SDK=$ANDROID_HOME

    # flutter
    export PATH="$PATH:$HOME/flutter/bin"
    export PATH="$PATH:$HOME/flutter/.pub-cache/bin"
    export PATH="$PATH:$HOME/.pub-cache/bin"

    # golang
    export GOPATH="$HOME/ghq"
    export GOROOT="/opt/homebrew/opt/go/libexec"
    export PATH="$PATH:$GOPATH/bin"

    # java
    export PATH="$PATH:/usr/local/opt/openjdk/bin"

    # llvm
    export PATH="$PATH:/usr/local/opt/llvm/bin"

    # python
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PATH:$PYENV_ROOT/bin"

    # rust
    export PATH="$PATH:$HOME/.cargo/env"
    export PATH="$PATH:$HOME/.cargo/bin"
  ;;

  "Linux" )
  ;;
esac

