" Function to set up the layout
function! SetupDebugLayout()
    " Close all existing windows
    only

    " Split windows to create the layout
    vsplit | wincmd l | split | wincmd j | split | wincmd k
    " Resize windows as needed
    vert resize 30  " Adjust the width of the right panels

    " Open the main code display panel in the left window
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    call setline(1, 'Code Display Panel')

    " Switch to the top right window and set up the execution control panel
    wincmd l
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    call setline(1, 'Execution Control Panel')
    call setline(2, '[Step Over] [Step In] [Step Out] [Continue] [Pause] [Stop]')

    " Switch to the middle right window and set up the variable watch panel
    wincmd j
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    call setline(1, 'Variable Watch Panel')
    call setline(2, 'var1: value')
    call setline(3, 'var2: value')

    " Switch to the bottom right window and set up the output/console panel
    wincmd j
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    call setline(1, 'Output/Console Panel')
    call setline(2, 'Output here')

    " Switch to the top right window and set up the call stack panel
    wincmd k
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    call setline(1, 'Call Stack Panel')
    call setline(2, 'function1')
    call setline(3, 'function2')

    " Set up the status bar
    wincmd j
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    call setline(1, 'Status Bar: File: main.c | Line: 5 | Status: Paused')
endfunction

" Bind the setup function to a command
command! SetupDebugLayout call SetupDebugLayout()
