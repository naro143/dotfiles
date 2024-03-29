" encoding,format
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac

" set python version
set pyxversion=3

" fast drawing
set lazyredraw " stop redraw while executing some commands
set ttyfast " enable fast terminal connection

set autoread " automatically read file changes
set hidden " allow to open other files

" not create unnecessary file
set nobackup
set noswapfile
set nowritebackup
set noundofile

" completion
set wildmenu
set wildmode=list:full

" tab
set expandtab " replace tab with spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
augroup go-indent
  autocmd!
  autocmd FileType go setlocal sw=4 ts=4 sts=4 noet
augroup END

" indent
set autoindent " keep current indent
set smartindent " indent for C-like syntax

" search
set incsearch " incremental search
set smartcase " ignore ignorecase when includes upper case letters
set ignorecase " ignore upper/lower case
set hlsearch " highlight search result
if has('nvim')
  set inccommand=nosplit " highlight replace
endif"

set wrapscan " re-search after end of file
set wildignore+=*/tmp*,*.so,*.swp,*.zip

"--- cursor ---
" move next/previous line by h,l
set whichwrap=b,s,h,l,<,>,[,],~

" enable mouse
if has('mouse')
  set mouse=a
  if !has('nvim')
    if has('mouse_sgr')
      set ttymouse=sgr
    elseif v:version>703 || v:version is 703 && has('patch632')
      set ttymouse=sgr
    else
      set ttymouse=xterm2
    endif
  endif
endif


" edit
set virtualedit=onemore " move to last character
set backspace=indent,eol,start " enable backspace

"--- copy/paste ---
" clipboard
if has('nvim')
  set clipboard=unnamed
else
  set clipboard=unnamed,autoselect
endif


" paste
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

