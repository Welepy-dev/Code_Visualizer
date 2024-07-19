function! SplitAndRunTUI()
  " Split the window vertically
  vsplit
  
  " Move to the left split
  wincmd h
  
  " Set the left window to readonly
  setlocal readonly
  
  " Get the current file's directory
  let l:current_dir = expand('%:p:h')
  
  " Execute the TUI program in the current directory
  execute 'term ' . l:current_dir . '/TUI'
  
  " Move back to the right split
  wincmd l
endfunction

" Map the function to a command for easy execution
command! SplitAndRunTUI call SplitAndRunTUI()
