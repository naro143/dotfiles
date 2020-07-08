export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.fzf/bin"

case `uname` in
  "Darwin" ) # requires gnu-sed
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
    export GOPATH="$HOME/go"
    export PATH="$PATH:$GOPATH/bin"
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$PATH:$GOENV_ROOT/bin"

    # java
    export PATH="$PATH:/usr/local/opt/openjdk/bin"

    # llvm
    export PATH="$PATH:/usr/local/opt/llvm/bin"

    # python
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PATH:$PYENV_ROOT/bin"
  ;;

  "Linux" )
  ;;
esac

