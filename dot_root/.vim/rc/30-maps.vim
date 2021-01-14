" leader key
let mapleader=','

" the most important lines ever
nnoremap ; :
vnoremap ; :

" pasting should not replace register
xnoremap p pgvy

" save with sudo
command! W w !sudo tee  > /dev/null

" allow repeat from visual mode
vnoremap . <C-c>.

" use ctrl+s for saving in all modes
noremap <C-s> :write<CR><Esc>
vnoremap <C-s> <C-c>:write<CR><Esc>
inoremap <C-s> <C-o>:write<CR><Esc>

" fzf (fuzzy finder) config from https://blog.avahe.tk/posts/neovim/fzf-ripgrep/
"nnoremap <leader>t :FZF<CR>
" :Files [PATH]	Files (runs $FZF_DEFAULT_COMMAND if defined)
nnoremap <C-f> <ESC><ESC>: Files!<CR>
inoremap <C-f> <ESC><ESC>: BLines!<CR>
" :Buffers	Open buffers
nnoremap <C-o> ESC><ESC>:Buffers<CR>
map <C-g> ESC><ESC>:BCommits<CR>
" :GFiles [OPTS]	Git files (git ls-files)
" nnoremap <C-g> :GFiles<CR> 
" :Rg [PATTERN] rg search result (ALT-A to select all, ALT-D to deselect all)
nnoremap \ :Rg<CR>

" cycle buffers
nnoremap <F2> :bprevious<CR>
inoremap <F2> <Esc>:bprevious<CR>
nnoremap <F3> :bnext<CR>
inoremap <F3> <Esc>:bnext<CR>

" other remaps
map <F5> <Esc>:NERDTreeToggle<CR>
map <F6> <Esc>:TagbarToggle<CR>
map <F7> <Esc>:UndotreeToggle<CR>
nnoremap <F8> :set hlsearch!<CR>
set pastetoggle=<F9>

" see 'scrGitGutterRevertHunkipts' section
nnoremap <F12> :BcGitGutterRevertHunklose<CR>

" gitgutter
map <Leader>gr <Esc>:GitGutterRevertHunk<CR>

" maps for tags
" map <M-Left> <C-T>
" map <M-Right> <C-]>
" nnoremap <C-[> <C-O>
map <C-F2> :echo 'Current time is ' . strftime('%c')<CR>
" nnoremap <C-[> <C-O>
" vmap <S-c> "0y
" nmap <C-S-c> "yiw
"<Ctrl-C> -- copy (goto visual mode and copy)
" imap <C-C> <C-O>vgG
" vmap <C-C> "*y<Esc>i


" see command mapping - https://vi.stackexchange.com/questions/12250/
function! ShowMappings()
    let cmd = getreg(':')

    echo "Mappings for " . cmd

    execute 'filter /' . cmd . '/ map'
endfunction

" cnoremap <CR> <CR>:call ShowMappings()<CR>
