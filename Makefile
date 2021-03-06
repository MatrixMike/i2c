# Compiler/linker setup ------------------------------------------------------

# Mac OS X-specific flags.  Comment these out if using Linux.
#PLATFORM = osx
#CC       = gcc
#CFLAGS   = -fast -Wall
#OSLIBS   = -Wl,-framework -Wl,IOKit
#LDFLAGS  =

# Linux-specific flags.  Comment these out if using Mac OS X.
PLATFORM = linux
CC       = gcc
CFLAGS   = -O3 -Wall
OSLIBS   =
LDFLAGS  =

# Example programs -----------------------------------------------------------

OBJS = blinkm eeprom nunchuk servo temperature
all: $(OBJS)

blinkm: blinkm.o i2c.o
	$(CC) $(LDFLAGS) blinkm.o i2c.o $(OSLIBS) -o blinkm

eeprom: eeprom.o i2c.o
	$(CC) $(LDFLAGS) eeprom.o i2c.o $(OSLIBS) -o eeprom

nunchuk: nunchuk.o i2c.o
	$(CC) $(LDFLAGS) nunchuk.o i2c.o $(OSLIBS) -o nunchuk

servo: servo.o i2c.o
	$(CC) $(LDFLAGS) servo.o i2c.o $(OSLIBS) -o servo

temperature: temperature.o i2c.o
	$(CC) $(LDFLAGS) temperature.o i2c.o $(OSLIBS) -o temperature

# I2C library i2c.o ----------------------------------------------------------

i2c.o: i2c-$(PLATFORM).c i2c.h
	$(CC) $(CFLAGS) i2c-$(PLATFORM).c -c -o i2c.o

# Maintenance and stuff ------------------------------------------------------

clean:
	rm -f $(OBJS) *.o core

*.o: i2c.h

.c.o:
	$(CC) $(CFLAGS) -c $*.c
