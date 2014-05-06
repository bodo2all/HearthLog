project:=HearthLog
path:=Heart_Log

objects=$(patsubst %.cpp, %.o, $(wildcard $(path)/*.cpp)) \
        $(patsubst %.cpp, %.o, $(wildcard $(path)/tcp/*.cpp))
cppflags=$(shell wx-config --cppflags) -std=gnu++11 -g
ldflags=$(shell wx-config --libs) -lpcap -std=gnu++11 -g

.PHONY: all

all: $(project)

link:
	-@ln -s "Hearth Log" $(path) > /dev/null

clean: $(objects)
	-rm $^ HearthLog

$(project): $(objects)
	g++ -o $@ $^ $(ldflags)

%.o:%.cpp
	g++ -c -o $@ $(cppflags) $<

