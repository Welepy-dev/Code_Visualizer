#include <ncurses.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <stdbool.h>

volatile sig_atomic_t	resize_flag = 0;	//Indicate if the window has been resized.

void	handle_winch(int sig)		//Sets resize_flag to 1 when there is a window change
{
	 resize_flag = 1;
}

void	resize_handler()			//Resizes by ending the current window and clearing it
{
	endwin();
	refresh();
	clear();
}

int	main(void)
{
	char text[] = "Texto Centralizado";
	int len = strlen(text);
	int ch;
	int row, col, central_h, central_v;
	bool running = true;

	initscr();
	signal(SIGWINCH, handle_winch);
	noecho();				//Disables echoing of typed characters
	cbreak();				//Disables line buffering, allowing immediate char input
	curs_set(FALSE);			//Hides cursor
	keypad(stdscr, TRUE);			//Enables keypad, to insert special chars like KEYUP

	while (running)
	{
		if (resize_flag)
		{
			resize_handler();
			resize_flag = 0;
		}//if resize_flag == 1, clears screen and resets resize_flag

		clear();

		getmaxyx(stdscr, row, col);	//Gets the current number of rows and columns

		central_h = (col / 2) - (len / 2) - 1;
		central_v = (row / 2) - 1;
		
		mvprintw(central_v, central_h, "%s", text);

		refresh();			//refreshes screen to show updated content
		timeout(100);
		
		ch = getch();
		if (ch == '\n')
			running = false;	//if [Enter] is pressed closes the program
	}
	endwin();
	return 0;
}

/*EXPLAINING "signal(SINGWICH, handle_winch)" [line 42]
 * this line sets up a signal handler to the C program
 * in unix systems signals notify processes that a specific event has ocured i.e a button press.
 * SIGWINCH stands for Signal Window Change, its a signal sent to a processe when a window is resised
 * the 'signal' function:
 * prototype(void (*signal(int sig, void (*func)(int)))(int);)
 * 'sig' is a signal number I whant to handle
 * 'func' is a pointer to the signal I want to handle
*/
