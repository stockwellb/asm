# Koan 25: Byte-at-a-Time Copy

**Goal**: Copy a 5-byte source buffer to a destination buffer in `.bss`, one byte per iteration. Then print the destination to verify.

**Practice**: indexed memory reads and writes.

**Success**: the program prints the source string.

---

**Hints**:
- `src: db "hello"` in `.data`
- `dst: resb 5` in `.bss`
- loop body: `mov al, [src + rcx]` / `mov [dst + rcx], al` / `inc rcx` / `cmp rcx, 5` / `jl loop`
- then `sys_write` with `rsi = dst`, `rdx = 5`
