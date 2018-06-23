CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
PREFIX ?= /usr/local

build:
	$(SHARDS_BIN) build $(CRFLAGS)
clean:
	rm -f ./bin/ameba ./bin/ameba.dwarf
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/ameba $(PREFIX)/bin
test: build
	$(CRYSTAL_BIN) spec
	./bin/ameba
