function! OpenWindow()
    " Split the window and move to the new window
    vsplit | wincmd l
    setlocal nomodifiable

    " Get the directory of the current Vimscript
    let script_dir = expand('/plugin:p:h')

    " Construct the path to the TUI program
    let program_path = script_dir . '/TUI'

    " Execute the compiled C program
    execute 'silent !' . program_path
    redraw!
endfunction

" Create a command to trigger the function
command! HelloWorld call OpenWindow()
