# start tmux
export PATH="/opt/homebrew/bin:$PATH" # to recognize tmux
[[ -z "$TMUX" ]] && tmux -u

ENABLE_CORRECTION="true"

source "$HOME/dotfiles/zsh/.p10k.zsh"
source "$HOME/dotfiles/zsh/path.zsh"
source "$HOME/dotfiles/zsh/alias.zsh"
source "$HOME/dotfiles/zsh/completion.zsh"
source "$HOME/dotfiles/zsh/directory.zsh"
source "$HOME/dotfiles/zsh/history.zsh"
source "$HOME/dotfiles/zsh/lang.zsh"
source "$HOME/dotfiles/zsh/plugin.zsh"
source "$HOME/dotfiles/zsh/command.zsh"
source "$HOME/dotfiles/zsh/customize.zsh"

# gitignore
source "$HOME/dotfiles/zsh/secret.zsh"

# settings for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob='!.git/*'"

# settings for gpg
export GPG_TTY=$(tty)

# display
setopt print_exit_value

# no peep
setopt no_beep
setopt no_hist_beep
setopt no_list_beep

# warning before delete
setopt rm_star_wait
