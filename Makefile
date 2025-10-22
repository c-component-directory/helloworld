CFLAGS = -Wall -Werror -O0 -fPIC
LDFLAGS_DYNAMIC = -shared
LDFLAGS_STATIC = -static
OBJECTS = main.o
PROJECT_DYNAMIC = libhelloworld.so
PROJECT_STATIC = libhelloworld.a

UNAME_S := $(shell uname -s)

all: $(PROJECT_DYNAMIC) $(PROJECT_STATIC)

$(PROJECT_DYNAMIC): $(OBJECTS)
ifeq ($(UNAME_S),Darwin)
	
	$(CC) $(CFLAGS) $(LDFLAGS_DYNAMIC) $(OBJECTS) -o $(basename $@).dylib
else
	$(CC) $(CFLAGS) $(LDFLAGS_DYNAMIC) $(OBJECTS) -o $@
endif

$(PROJECT_STATIC): $(OBJECTS)
ifeq ($(UNAME_S),Darwin)
	ar rcs $@ $(OBJECTS)
else
	$(CC) $(CFLAGS) $(LDFLAGS_STATIC) $(OBJECTS) -o $@
endif

clean:
	rm -f $(OBJECTS) $(PROJECT_DYNAMIC) $(PROJECT_STATIC)
