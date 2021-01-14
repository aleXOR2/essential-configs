
call plug#begin($LOCAL_BUNDLE_PATH)

" vim themes
Plug 'morhetz/gruvbox'

" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'Valloric/YouCompleteMe'
Plug 'hallison/vim-markdown'
" Plug 'bitfyre/vim-indent-html' - old vim html indent from vim-scripts.org
" newer version
Plug 'othree/html5.vim'
" Plug 'vim-scripts/ttcn-syntax' - I don't use ttcn3 anymore :-)
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nickhutchinson/vim-cmake-syntax'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'

" files and movement
Plug 'vim-scripts/a.vim'
Plug 'nelstrom/vim-visual-star-search'

" additional tools
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'

" fzf
" set rtp+=~/.fzf - modifies runtime path (see https://medium.com/usevim/vim-101-runtimepath-83194d411b0a )
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Initialize plugin system
call plug#end()

