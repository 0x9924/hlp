SDL_CFLAGS := $(shell sdl2-config --cflags)
SDL_LDFLAGS := $(shell sdl2-config --libs)

#g++ -o appname file.cpp -lSDLmain -lSDL_net
main:
	g++ -o build/$@ $@.c $(SDL_LDFLAGS) 
