//File: main.cpp


#include <iostream>
#include <chrono>
#include <thread>

using std::cout;
using std::endl;

//SDL stuff.
#include <SDL2/SDL.h>

int main (int argc, char *argv[]) {
    cout << "Hello window!\n";

    SDL_Window *win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480,
                                       SDL_WINDOW_SHOWN);
    if (win == nullptr) {
        std::cout << "SDL_CreateWindow Error: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }



    SDL_Renderer *ren = SDL_CreateRenderer(
        win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);

    if (ren == nullptr){
        SDL_DestroyWindow(win);
        std::cout << "SDL_CreateRenderer Error: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }


    bool loop{true};
    
    while (loop) {
        SDL_Event event;
        while (SDL_PollEvent ( &event) ) {

           switch( event.type ){
                    /* Keyboard event */
                    case SDL_KEYDOWN:
                        std::cout << "key down" << std::endl;
                        break;
                    case SDL_KEYUP:
                        std::cout << "key up" << std::endl;
                        break;

                    /* SDL_QUIT event (window close) */
                    case SDL_QUIT:
                        loop = false;
                        break;

                    default:
                        break;
                }

            }
    
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
        

    
    
// SDL_DestroyTexture(tex);
SDL_DestroyRenderer(ren);
SDL_DestroyWindow(win);
SDL_Quit();

    /* if (SDL_Init (SDL_INIT_VIDEO) < 0) { */
    /*     cout << "Couldn't initialize SDL: %s\n"; */
    /*     exit (1); */
    /* } else { */
    /*     cout << "SDL initialized correctly!\n"; */
    /* } */
    /* //Important, otherwise stdout.txt */
    /* //might not be written two. */
    /* atexit (SDL_Quit); */
    
    /* SDL_Quit(); */

    return 0;
}
