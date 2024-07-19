" hello.vim
function! HelloVim()
    " Call the external C program
    silent !./TUI
endfunction

" Create a Vim command to run the function
command! HelloVim call HelloVim()

