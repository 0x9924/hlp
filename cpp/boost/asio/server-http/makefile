CXXFLAGS = -Wall -lboost_system -pthread -I./include 

CPP_FILES = $(wildcard ./src/*.cpp)
OBJECTS = $(CPP_FILES:./src/%.cpp=./obj/%.o)


main:$(OBJECTS)
	g++ -o build/http-server $@.cpp $(OBJECTS) $(CXXFLAGS)

obj/%.o: src/%.cpp
	g++ -c -o $@ $< $(CXXFLAGS)

clean:
	find build -type f  -exec rm {} \;
	find obj -type f -exec rm {} \;
