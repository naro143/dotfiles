set shell=/bin/zsh

"--- load settings ---
source $HOME/dotfiles/vim/base.vim
source $HOME/dotfiles/vim/fold.vim
source $HOME/dotfiles/vim/keymap.vim
source $HOME/dotfiles/vim/view.vim
source $HOME/dotfiles/vim/color.vim

"--- load settings(plugin) ---
source $HOME/dotfiles/vim/dein.vim

" force disabling concealing
augroup markdown-conceal
  autocmd!
  autocmd FileType markdown setl conceallevel=0
augroup END

filetype plugin indent on
syntax on

