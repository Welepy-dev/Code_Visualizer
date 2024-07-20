#include <ncurses.h>

int main() {
    // Initialize the ncurses library
    initscr();
    // Print "Hello, World!" to the screen
    addstr("Hello, World!");
    // Refresh the screen to show the output
    // End ncurses mode
    endwin();
    return 0;
}

