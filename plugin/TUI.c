#include <ncurses.h>

int main() {
    // Initialize the ncurses library
    initscr();
    // Print "Hello, World!" to the screen
    printw("Hello, World!");
    // Refresh the screen to show the output
    refresh();
    // Wait for user input
    getch();
    // End ncurses mode
    endwin();
    return 0;
}

