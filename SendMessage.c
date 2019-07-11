#define UNICODE 1
#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>

#pragma comment (lib, "User32.lib")
#pragma comment (lib, "Kernel32.lib")
#pragma comment (lib, "Shell32.lib")
//#pragma comment(linker,"\"//MANIFESTFILE:app.manifest\"")


int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PWSTR pCmdLine, int nCmdShow)
{
    int argc;
    LPWSTR *argv = CommandLineToArgvW(GetCommandLineW(), &argc);

	if (argc != 5) {
		fwprintf(stderr, L"usage: %s hwnd msg wParam lParam %u\n", argv[0], argc);
		return 1;
	}

	SendMessage((HWND)_wtoi(argv[1]), (UINT)_wtoi(argv[2]), (WPARAM)_wtoi(argv[3]), (LPARAM)_wtoi(argv[4]));

	return 0;
}
