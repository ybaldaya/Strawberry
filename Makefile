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

CC=gcc

all: $(EXEC)
	$(CC) $(LDFLAGS) -s -ffast-math -fno-unit-at-a-time -o src/$@ $+ $(LDADD)

install: all
	install -Dm 755 src/strawberry $(DESTDIR)$(BINDIR)/
	cp ${FILE_DESKTOP} ${XSDIR}/
	cp ${MANEXEC} ${MANPREFIX}

clean:
	rm -fv src/*.o src/${EXEC}

uninstall:
	@echo removing all files...
	@rm -f ${DESTDIR}${BINDIR}/${EXEC}
	@rm -f ${MANPREFIX}${EXEC}.1
	@rm -f ${XSDIR}/${FILE_DESKTOP}

