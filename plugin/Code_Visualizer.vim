if !has("python3")
  echo "Error: Python3 is required for this plugin."
  finish
endif

"vsplit | wincmd l

function! StartSpinningDonut()
	
vsplit | wincmd l
  python3 << EOF
import vim
import curses
import time
import math

def draw_donut(stdscr):
    stdscr.nodelay(1)
    curses.curs_set(0)
    sh, sw = stdscr.getmaxyx()
    w = curses.newwin(sh, sw, 0, 0)

    A = 10
    B = 10
    R1 = 1
    R2 = 2
    K2 = 5
    K1 = sh * K2 * 3 / (8 * (R1 + R2))
    
    while True:
        w.clear()
        z = [0] * 1760
        b = [' '] * 1760
        for j in range(0, 628, 7):
            for i in range(0, 628, 2):
                c = math.sin(i)
                d = math.cos(j)
                e = math.sin(A)
                f = math.sin(j)
                g = math.cos(A)
                h = d + R2
                D = 1 / (c * h * e + f * g + K2)
                l = math.cos(i)
                m = math.cos(B)
                n = math.sin(B)
                t = c * h * g - f * e
                x = int(40 + 30 * D * (l * h * m - t * n))
                y = int(12 + 15 * D * (l * h * n + t * m))
                o = int(x + 80 * y)
                N = int(8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n))
                if 0 <= y < 22 and 0 <= x < 80 and D > z[o]:
                    z[o] = D
                    b[o] = '.,-~:;=!*#$@'[N if N > 0 else 0]

        for k in range(1760):
            w.addch(k // 80, k % 80, b[k])

        w.refresh()
        A += 0.04
        B += 0.02
        time.sleep(0.03)

def main():
    curses.wrapper(draw_donut)

if __name__ == "__main__":
    main()
EOF
endfunction

command! SpinningDonut call StartSpinningDonut()

