" Vimscript equivalent of the given C code
function! ResizeHandler()
    redraw!
endfunction

function! HandleWinch()
    call ResizeHandler()
endfunction

function! CenteredText()
    let text = "Texto Centralizado"
    let len = strlen(text)
    let running = 1

    call system('stty -echo') " Equivalent to noecho()
    call system('stty cbreak') " Equivalent to cbreak()
    call system('tput civis') " Equivalent to curs_set(FALSE)

    while running
        call HandleWinch()

        redraw!
        let [row, col] = getmaxyx()
        let central_h = (col / 2) - (len / 2) - 1
        let central_v = (row / 2) - 1

        call cursor(central_v, central_h)
        echo text

        let ch = getchar(0) " Equivalent to timeout(100) and getch()
        if ch == "\n"
            let running = 0 " Exit the loop if [Enter] is pressed
        endif
    endwhile

    call system('stty echo') " Restore echo
    call system('tput cnorm') " Restore cursor
endfunction

function! GetMaxyx()
    let col = winwidth(0)
    let row = winheight(0)
    return [row, col]
endfunction

call CenteredText()
