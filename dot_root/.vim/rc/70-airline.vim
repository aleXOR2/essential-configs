set laststatus=2

let g:airline_section_warning=''
let g:airline_theme='dark'
let g:airline_exclude_preview=1

" show opened buffers as tabs
let g:airline#extensions#tabline#enabled = 1

" just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts=1
