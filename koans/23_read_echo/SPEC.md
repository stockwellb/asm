# Koan 23: Read a Character, Echo It

**Goal**: Read one byte from stdin with `sys_read`, write it back to stdout with `sys_write`.

**Practice**: both halves of the I/O pipeline.

**Success**: `echo x | ./your_binary` prints `x`.

---

**Hints**:
- `sys_read` is syscall 0; args: `rdi = 0` (stdin fd), `rsi = buffer`, `rdx = max length`
- allocate a 1-byte buffer in `.bss`: `buf: resb 1`
- do the read first, then the write, both against the same buffer
