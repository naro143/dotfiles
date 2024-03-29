" view

" font
set guifont=SauceCodePro\ Nerd\ Font\ Medium:h14

set ambiwidth=double  " show chars like □, ○
set nocursorline      " hide cursor line
set nocursorcolumn    " hide cursor column
set noshowcmd         " hide cmd
set noshowmode        " hide mode
set number            " show line number
set signcolumn=yes    " always show signcolumn
set showmatch         " show matched braces
set matchtime=1       " show matched braces instantly
set laststatus=2      " always show statusline
set display+=lastline " display long line

" show zenkaku space
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=red guibg=black
endfunction
if has('syntax')
  augroup zenkaku-space
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" show markdown symbols
augroup markdown
  autocmd!
  autocmd FileType markdown setl conceallevel=0
augroup END

augroup typescript
  autocmd!
  autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found=1
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

