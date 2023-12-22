LUAC     := luac
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SOURCES  := $(shell find $(ROOT_DIR)/templates.lua $(ROOT_DIR)/services -type f -name '*.lua')
CHUNKS   := $(SOURCES:.lua=.luac)

ifeq ($(shell go env GOOS),darwin)
LUAC := luac-5.1
endif

test:
	@luarocks test

setup:
	luarocks install busted
	luarocks install --only-deps luadns-templates-dev-1.rockspec

build: $(CHUNKS)

clean:
	@rm -f $(CHUNKS)

%.luac: %.lua
	$(LUAC) -o $@ $<
