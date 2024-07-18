function! OpenWindow()
    " Execute the compiled C program
    vsplit
    wincmd l
    execute 'silent !./TUI'
    redraw!
endfunction

" Create a command to trigger the function
command! HelloWorld call OpenWindow()

