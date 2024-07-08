" Title:        Code Visualizer
" Description:  A plugin to provide an visual representation of the code
" Last Change:  8 July 2024
" Maintainer:   Welepy-dev https://github.com/Welepy-dev

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_Code_Visualizer")
    finish
endif
let g:loaded_Code_Visualizer = 1

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 DisplayTime call example-plugin#DisplayTime()
command! -nargs=0 DefineWord call example-plugin#DefineWord()
command! -nargs=0 AspellCheck call example-plugin#AspellCheck()
    
