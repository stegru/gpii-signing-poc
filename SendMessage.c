#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>

#pragma comment (lib, "User32.lib")
#pragma comment (lib, "Kernel32.lib")
//#pragma comment(linker,"\"//MANIFESTFILE:app.manifest\"")

#include <WinBase.h>


int main(int argc, char **argv)
{
	if (argc != 4) {
		fprintf(stderr, "usage: %s hwnd msg wParam lParam", argv[0]);
		return 1;
	}

	SendMessage(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4]));

	return 0;
}
