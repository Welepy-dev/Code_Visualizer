#include <ncurses.h>
#include <stdlib.h>

void open_window() {
    initscr();            // Start ncurses mode
    cbreak();             // Line buffering disabled
    noecho();             // Don't echo() while we do getch
    int startx = 0;
    int starty = 0;
    int width = 40;
    int height = 10;

    WINDOW *win = newwin(height, width, starty, startx);
    box(win, 0, 0);       // Draw a box around the window
    mvwprintw(win, 1, 1, "Hello World"); // Print message
    wrefresh(win);        // Refresh window to show content
    getch();              // Wait for user input
    endwin();             // End ncurses mode
}

int main(int argc, char *argv[]) {
    open_window();
    return 0;
}

