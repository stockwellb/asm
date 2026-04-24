# Koan 22: Write One Character

**Goal**: Print the single character `A` to stdout.

**Practice**: tiny buffers; or, as a stretch, using the stack as a buffer.

**Success**: running the program prints `A`.

---

**Hints**:
- easy version: `.data` has `ch: db "A"`, length 1
- stretch: `push` a byte onto the stack, use `rsp` as the buffer pointer (remember the stack grows down and is 8-byte aligned)
- ASCII `'A'` = 65 = 0x41
