//File: main.cpp

//Program: SDL_HelloWorld

#include <iostream>
using std::cout;
using std::endl;

//SDL stuff.
#include <SDL2/SDL.h>

int main (int argc, char *argv[]) {
    cout << "Hello World!\n";
    
    if (SDL_Init (SDL_INIT_VIDEO) < 0) {
        cout << "Couldn't initialize SDL: %s\n";
        exit (1);
    } else {
        cout << "SDL initialized correctly!\n";
    }
    //Important, otherwise stdout.txt
    //might not be written two.
    atexit (SDL_Quit);
    
    SDL_Quit();

    return 0;
}
