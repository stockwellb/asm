# Koan 03: Add

**Goal**: Put 10 in `rax` and 5 in `rbx`, then exit with their sum (15).

**Practice**: `add` between two registers.

**Success**: `echo $?` prints `15`.

---

**Hints**:
- `add rax, rbx` computes `rax + rbx` and stores the result in `rax`
- remember to move the result to `rdi` before the exit syscall
