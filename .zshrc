# Created by newuser for 5.2
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"

alias ls='ls -G'
alias g='git'
#archey3
#--------------------------------
PATH=$PATH:~/bin
export PATH

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
