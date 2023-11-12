# Compiler settings
CC = gcc
CFLAGS = -Wall -Werror -fPIC

# Library settings
LIBNAME = libcrc
LIBVERSION = 1.0.0
LIBSONAME = $(LIBNAME).so.$(LIBVERSION)
LIBTARGET = $(LIBNAME).so.$(LIBVERSION).0

# Source files
SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c, %.o, $(SRCS))

all: $(LIBTARGET)

$(LIBTARGET): $(OBJS)
	$(CC) -shared -Wl,-soname,$(LIBSONAME) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(LIBTARGET) $(LIBSONAME)

.PHONY: all clean

