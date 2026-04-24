# Auto-discover all .asm files in topic folders (anything that is not lib/)
TOPIC_SOURCES := $(shell find . -mindepth 2 -name "*.asm" -not -path "./lib/*")
LIB_SOURCES   := $(wildcard lib/*.asm)
LIB_OBJECTS   := $(LIB_SOURCES:.asm=.o)
BINARIES      := $(TOPIC_SOURCES:.asm=)

NASM      := nasm
NASMFLAGS := -f elf64 -g -F dwarf -I lib/
LD        := ld

.PHONY: all clean list

all: $(BINARIES)

# Build any <dir>/<name> from <dir>/<name>.asm, linking in any lib objects
%: %.asm $(LIB_OBJECTS)
	$(NASM) $(NASMFLAGS) $< -o $@.o
	$(LD) $@.o $(LIB_OBJECTS) -o $@

# Lib objects
lib/%.o: lib/%.asm
	$(NASM) $(NASMFLAGS) $< -o $@

list:
	@echo "Binaries:"
	@for b in $(BINARIES); do echo "  $$b"; done

clean:
	find . -name "*.o" -delete
	@for bin in $(BINARIES); do rm -f "$$bin"; done
