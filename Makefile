prefix=/usr/local
includedir=$(prefix)/include
libdir=$(prefix)/lib
pkgconfigdir=$(libdir)/pkgconfig

-include config.mak

ALL_HEADERS=atk-bridge.h
ALL_PKGCONFIG=atk-bridge-2.0.pc

all: $(ALL_HEADERS) $(ALL_PKGCONFIG)

install: install-headers install-pkgconfig

install-headers: $(ALL_HEADERS:%=$(DESTDIR)$(includedir)/%)
install-pkgconfig: $(ALL_PKGCONFIG:%=$(DESTDIR)$(pkgconfigdir)/%)

$(DESTDIR)$(includedir)/%: $(ALL_HEADERS)
	install -D -m 644 $< $@

$(DESTDIR)$(pkgconfigdir)/%: $(ALL_PKGCONFIG)
	install -D -m 644 $< $@

.PHONY: all install install-headers install-pkgconfig

