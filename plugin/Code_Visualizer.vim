function! OpenWindow()
    " Execute the compiled C program
    vsplit
    wincmd l
    enew
    " Make the buffer read-only
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal readonly
    execute 'silent !./TUI'
    redraw!
endfunction

" Create a command to trigger the function
command! HelloWorld call OpenWindow()

