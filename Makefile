CC ?= cc
CFLAGS ?= -O2
PREFIX ?= /usr/local
LDFLAGS ?=
LDLIBS = -lm

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
  LDLIBS += -framework IOKit -framework CoreFoundation
endif

fetch: fetch.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS)

install: fetch
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 fetch $(DESTDIR)$(PREFIX)/bin/fetch

clean:
	rm -f fetch

.PHONY: install clean
