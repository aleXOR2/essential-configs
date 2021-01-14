" automatically write on buffer change
au FocusLost * :wa
set autowrite

" no error bells
set noerrorbells
set visualbell t_vb=

" makefiles need tabs
autocmd FileType make set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
" nasm in assembly
autocmd FileType asm set syntax=nasm

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" shell-like tab completion of commands
set wildmenu
set wildmode=list:longest

" do not clear clipboard register on exit
" autocmd VimLeave * call system("xclip -o | xclip -selection c")
" autocmd VimLeave * echo "Demo call" - doesnot work
" autocmd VimLeave * call writefile([getreg()], '/tmp/some_file', 'a')
autocmd VimLeave * call system('echo -n ' . shellescape(getreg('+')) . ' | xclip -selection clipboard')
" call system("echo selection + is " . getreg('+'))
" autocmd VimLeave * call system('echo -n ' shellescape(getreg('+')) '| xclip -selection clipboard')
