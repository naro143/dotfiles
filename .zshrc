# Created by newuser for 5.2
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"

alias ls='ls -G'
alias weather='weather.sh'
alias proxy_school='export http_proxy=http://172.16.2.22:8080; export https_proxy=http://172.16.2.22:8080'
alias g='git'
#archey3
#--------------------------------
PATH=$PATH:~/bin
export PATH
export ANT_HOME="/Applications/apache-ant-1.10.1/"
export PATH=$ANT_HOME/bin:$PATH

export ELASTICPATH=/usr/local/bin/
export PATH=$PATH:$ELASTICPATH

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$HOME/google-cloud-sdk/platform/google_appengine

#--------------------------------------
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
export WORKON_HOME=~/.virtualenvs
export PATH="$HOME/.pyenv/shims:$PATH"

export PATH="$HOME/flutter/bin:$PATH"
#export PATH="$HOME/flutter-0.3.2-beta/bin:$PATH"

#source /usr/local/bin/virtualenvwrapper.sh
#export WORKON_HOME=$HOME/.virtualenvs
#--------------------------------------
source ~/.zplug/init.zsh

# (1) プラグインを定義する
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'

# (2) インストールする
if ! zplug check --verbose; then
 printf 'Install? [y/N]: '
 if read -q; then
   echo; zplug install
 fi
fi

zplug load #--verbose
eval export PATH="/Users/naro/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source '/usr/local/Cellar/pyenv/1.1.1/libexec/../completions/pyenv.zsh'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/naro/Downloads/cocos2d-x-3.16/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/naro/Downloads"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/naro/Downloads/cocos2d-x-3.16/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Applications/cocos2d-x-3.16/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Applications"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Applications/cocos2d-x-3.16/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT="/Applications/android-ndk-r14b/"
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT="/Users/naro/Library/Android/sdk"
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Applications/cocos2d-x-3.16/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Applications"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Applications/cocos2d-x-3.16/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT="/Applications/apache-ant-1.10.1//bin/"
export PATH=$ANT_ROOT:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/naro/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/naro/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/naro/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/naro/google-cloud-sdk/completion.zsh.inc'; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/sbin:$PATH"
