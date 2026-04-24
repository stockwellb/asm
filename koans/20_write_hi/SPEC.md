# Koan 20: Write "hi\n" to stdout

**Goal**: Use `sys_write` to print `hi` followed by a newline.

**Practice**: your first real syscall with a buffer.

**Success**: running the program prints `hi` and a newline.

---

**Hints**:
- `sys_write` is syscall 1
- args: `rdi = 1` (stdout fd), `rsi = pointer to buffer`, `rdx = length`
- add a `.data` section: `msg: db "hi", 10` (10 = newline)
- then: `mov rax, 1` / `mov rdi, 1` / `mov rsi, msg` / `mov rdx, 3` / `syscall`
- exit cleanly afterward (koan 01 pattern)
