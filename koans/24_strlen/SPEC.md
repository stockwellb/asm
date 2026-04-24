# Koan 24: String Length

**Goal**: Given a null-terminated string in `.data`, compute its length. Exit with the length as the exit code. For `"hello"`, exit with 5.

**Practice**: pointer-based loop, comparing a memory byte to zero.

**Success**: `echo $?` prints the length.

---

**Hints**:
- string: `str: db "hello", 0`
- `mov rsi, str` / `xor rcx, rcx`
- loop: `cmp byte [rsi + rcx], 0` / `je done` / `inc rcx` / `jmp loop`
- `byte [rsi + rcx]` says "dereference one byte at this address"
- at `done`: `mov rdi, rcx`, then exit
