# Koan 18: Swap via Stack

**Goal**: Set `rax = 7`, `rbx = 11`. Swap them using only `push`/`pop` (no `xchg`, no temp register, no XOR tricks). Exit with `rax` — should print 11.

**Practice**: using the stack as a temporary.

**Success**: `echo $?` prints `11`.

---

**Hints**:
- push both
- pop them back — but in the _opposite_ order
- `push rax` / `push rbx` / `pop rax` / `pop rbx`
