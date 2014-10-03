ifneq (DEBUG, "-g")
	DEBUG += -O2
else
	DEBUG += -Wa,-adhln
endif
CC=gcc
CXX=g++
FLAGS= -lcds -lpthread -lrt -Wall
CFLAGS = -std=gnu11 $(FLAGS) $(DEBUG)
LDFLAGS = $(DEBUG) -lcds
CXXFLAGS = -std=c++11 $(FLAGS)
OUT1 = test_cds
OBJ1 = test_cds.o

all: $(OUT1)

.PHONY: all

$(OUT1): $(OBJ1)
	$(CXX) $(OBJ1) -o $@ $(CXXFLAGS)

%.o : %.cc %.h
	$(CXX) -o $@ -c $< $(CXXFLAGS)

.PHONY: debug

debug: clean
	$(MAKE) $(MAKEFILE) all DEBUG="-g"

.PHONY: lst

lst: clean
	$(MAKE) $(MAKEFILE) all DEBUG="-Wa,-adhln -g" > file.lst

.PHONY: clean

clean:
	rm -f *.o *~ relaxed peterson peterson_c11 *.lst
