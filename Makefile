CC ?= cc
CFLAGS ?= -O2
PREFIX ?= /usr/local
LDFLAGS ?=
LDLIBS = -lm

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
  LDLIBS += -framework IOKit -framework CoreFoundation
endif

TARGET := $(shell $(CC) -dumpmachine 2>/dev/null)
ifneq (,$(findstring mingw,$(TARGET)))
  EXE := .exe
  LDLIBS += -lws2_32 -liphlpapi -ladvapi32 -luser32 -lgdi32
endif

fetch$(EXE): fetch.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS)

install: fetch
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 fetch $(DESTDIR)$(PREFIX)/bin/fetch

clean:
	rm -f fetch fetch.exe

.PHONY: install clean
