" hello_world.vim

function! OpenHelloWorldWindow()
    " Split the window vertically
    vsplit

    " Move to the new window
    wincmd l

    " Create a new, unnamed buffer
    enew

    " Add 'Hello World' text to the new buffer
    call setline(1, 'Hello World')

    " Make the buffer read-only
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal readonly

    " Move to window 2 (assuming you want to set window 2 to be non-modifiable)
    2wincmd w
    " Set the buffer in window 2 to be non-modifiable
    setlocal nomodifiable

endfunction

command! HelloWorld call OpenHelloWorldWindow()
