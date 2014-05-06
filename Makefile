project:=HearthLog

objects=$(patsubst %.cpp, %.o, $(wildcard $(project)/*.cpp)) \
        $(patsubst %.cpp, %.o, $(wildcard $(project)/tcp/*.cpp))
cppflags=$(shell wx-config --cppflags) -std=gnu++11
ldflags=$(shell wx-config --libs) -std=gnu++11

.PHONY: all
.PRECIOUS: link

all: link $(project)

link:
	-@ln -s "Hearth Log" $(project) > /dev/null

clean: $(objects)
	rm $^ HearthLog

$(project): $(objects)
	g++ -o $@ $^ $(ldflags)

%.o:%.cpp
	g++ -c -o $@ $(cppflags) $<

