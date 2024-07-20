" hello.vim
function! HelloVim()
    " Open a new vertical split window
    vsplit

    " Create a new empty buffer in the new split window
    enew

    " Set the window name to "Code_Visualizer"
    let w:window_name = "Code_Visualizer"

    " Set the buffer in the new window to be non-modifiable
      setlocal nomodifiable

    " Call the external C program
    silent !./TUI
endfunction

" Create a Vim command to run the function
command! HelloVim call HelloVim()
