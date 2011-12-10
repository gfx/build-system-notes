
CXX = clang++ -Wall -Wextra -std=c++0x -c -o

LD = clang++ -o


default: hello
    @echo :default finished

clean:
	rm -rf hello.o hello

hello: hello.o
	$(LD) hello hello.o

hello.o: hello.cpp hello.h
	$(CXX) hello.o hello.cpp


