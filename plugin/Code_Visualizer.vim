function! OpenWindow()
    " Execute the compiled C program
    execute 'silent !./TUI'
    redraw!
endfunction

" Create a command to trigger the function
command! HelloWorld call OpenWindow()

