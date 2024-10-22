function! HelloVim()
    " Open a new vertical split window
    "vsplit | enew

    " Create a new terminal buffer in the new split window and run the TUI program
    vert terminal ./TUI

    " Goes to the window below and closes it
    "wincmd J | quit

    " Set the window name to "Code_Visualizer"
    let w:window_name = "Code_Visualizer"

    " Set the buffer in the new window to be non-modifiable
    setlocal nomodifiable
endfunction

" Create a Vim command to run the function
command! HelloVim call HelloVim()
