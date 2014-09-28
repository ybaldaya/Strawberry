#Makefile for Strawberry project wm

CFLAGS+= -g -std=c99 -pedantic -Wall -02 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTY_SOURCE=2

LDADD+= -lX11 -lXinerama

LDFLAGS= -Wl,-O1,--sort-common,--as-needed,-z-relro

EXEC=Strawberry

PREFIX?= /usr/local
BINDIR?= $(PREFIX)/bin

MANPREFIX = ${PREFIX}/share/man/man1/
MANEXEC = docs=${EXEC}.1

FILE_DESKTOP = Strawberry.desktop
XSDIR?= /usr/share/xsessions
