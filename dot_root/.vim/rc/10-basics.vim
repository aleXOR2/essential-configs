" enable syntax
syntax on

" shell
set shell=/bin/bash
set clipboard=unnamedplus  " yank to xclip - https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim
set number

" setup search options
set showmatch
set incsearch

set ignorecase
set smartcase

" magic search by default
nnoremap / /\v
vnoremap / /\v

" paste from 0 register to avoid yanked text replaced on deletion,
" replacement, etc
" https://stackoverflow.com/questions/54255/in-vim-is-there-a-way-to-delete-without-putting-text-in-the-register
noremap  p "0p
noremap  P "0P
vnoremap p "0p
vnoremap P "0P

" map CTRL + SHIFT + P for yank

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=4

set autoindent
set smartindent
set backspace=indent,eol,start

" show current mode
set showmode

" enable mouse
set mouse=a

if !has('nvim')
    set ttymouse=sgr
endif

" allow local vimrc
set exrc

" remember cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" search for tags file up to /
set tags="tags;/"


" disable autoindent on pasting from clipboard - https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/38258720#38258720
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode
" if !has('win32')
"     let &t_SI .= "\<Esc>[?2004h"
"     let &t_EI .= "\<Esc>[?2004l"
" 
" 
"     function! XTermPasteBegin()
"       set pastetoggle=<Esc>[201~
"       set paste
"       return ""
"     endfunction
" 
"    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" endif

" disable splash
set shortmess=I

" hybrid linenumbes
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
