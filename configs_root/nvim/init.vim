" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20

if has('persistent_undo')
  set undofile	" keep an undo file (undo changes after closing)
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif


function! SaveWithDateStamp(filename) range
    let l:extension = '.' . fnamemodify( a:filename, ':e' )
    if len(l:extension) == 1
        let l:extension = '.txt'
    endif

    let l:filename = escape( fnamemodify(a:filename, ':r') . strftime("_%d_%m_%Y") . l:extension, ' ' )

    execute "write " . l:filename
endfunction

" save with date stamp use: :SWDT myfilename. This yields to myfilename_01_02_2020.txt to be written
command! -nargs=1 SWDT call SaveWithDateStamp( <q-args> )

"General Settings using https://github.com/makccr/dot/tree/master/.config/nvim and https://www.chrisatmachine.com/Neovim/02-vim-general-settings/
"set mouse=a                             " Enable your mouse
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
"set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" from https://www.youtube.com/watch?v=FWUeqcBQmDo
autocmd! FileTYpe tex,latex,markdonw setlocal spell spellang=en_us
set hls is ic
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup
set clipboard+=unnamedplus

set number
" relative linenumber only in normal mode
" https://youtu.be/Kx-SDJwL01o?t=367
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" multiline paste bug

" ref: https://stackoverflow.com/a/38258720/62202
" ref: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

" nnoremap <F2> :set invpaste paste?<CR>


set pastetoggle=<F2>
set showmode

set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
:nmap <leader>l :set invlist<CR>

"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]


" Color Settings "
set background=dark cursorline termguicolors

" something to do with non printed chars"
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'"
" highlight  cursor https://superuser.com/questions/611117/highlight-the-character-the-cursor-is-on-in-vim
" use https://terminal.sexy/ or manjaro embeded gcolor2
highlight Cursor guibg=#626262
highlight CursorLine guibg=#777777

" Mappings "
let g:mapleader = " " " \<Space> https://www.chrisatmachine.com/Neovim/02-vim-general-settings/
nnoremap <leader>n :Explore<CR>
nnoremap <leader><Space> :CtrlP<CR>
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap Q <nop>
" reszie windows with cursor keys (to see more of the command bar)
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" use Ctrl+L to toggle the line number counting method https://gist.github.com/joequery/3418841
function! g:ToggleNuMode()
  if &rnu == 1 && mode() != 'i'
     set nonu   " turn off nu
     set nornu
  else
     set nu   " turn off rnu
     set rnu
  endif
endfunction

nnoremap <C-L> :call g:ToggleNuMode()<cr>
