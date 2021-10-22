alias c='clear'
alias ls='ls -alhG'
alias mv='mv -i'
alias cp='cp -i'

# vim
alias v='vim'
alias vi='vim'

# requires procs
alias memory='procs --watch --sortd mem'
alias cpu='procs --watch --sortd cpu'

# requires tree
alias tree='tree -a -I "\.DS_Store|\.git|\.svn|node_modules|vendor|volumes" -N -A -C'

# requires trash
alias rm='trash -r'

# requires gsed
alias sed='gsed'

# requires github/gh/gh
alias github="gh repo view --web"
alias pr="gh pr create"

alias dc='docker-compose'
alias kc='kubectl'

