# Koan 01: Exit Zero

**Goal**: Exit with status code 0.

**Practice**: the `sys_exit` syscall — the simplest useful program you can write.

**Success**: `echo $?` after running prints `0`.

---

**Hints** (peek only if stuck):
- syscall number for `sys_exit` is 60 (goes in `rax`)
- exit code goes in `rdi`
- trigger with the `syscall` instruction
