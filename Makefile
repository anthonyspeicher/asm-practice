# USAGE: make filename (no .asm extension)

# compiler and linker data

ASM_COMPILER := nasm
COMPILER_FLAGS := -f elf
ASM_LINKER := ld
LINKER_FLAGS := -m elf_i386 -s


# extract .asm arguments
ASMFILES := $(filter %.asm,$(MAKECMDGOALS))
BINS := $(ASMFILES:.asm=)


# compile and link
all: $(BINS)

%: %.o
	$(ASM_LINKER) $(LINKER_FLAGS) $<

%.o: %.asm
	$(ASM_COMPILER) $(COMPILER_FLAGS) $<


clean:
	rm -f *.o *.out
