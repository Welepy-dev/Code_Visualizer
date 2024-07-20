function! HelloVim()
    " Open a new vertical split window
    vsplit | enew | wincmd H | quit

    " Create a new terminal buffer in the new split window and run the TUI program
    terminal ./TUI

    " Set the window name to "Code_Visualizer"
    let w:window_name = "Code_Visualizer"

    " Set the buffer in the new window to be non-modifiable
    setlocal nomodifiable
endfunction

" Create a Vim command to run the function
command! HelloVim call HelloVim()
