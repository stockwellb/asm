# Koan 17: Stack LIFO

**Goal**: Push `1`, `2`, `3` in that order. Then pop three times and arrange the result so `echo $?` prints `123` (first pop is 3 → hundreds place, second is 2 → tens, third is 1 → ones).

**Practice**: `push`/`pop` and LIFO semantics.

**Success**: `echo $?` prints `123`.

---

**Hints**:
- `push rax` → `rsp -= 8`, then writes `rax` to `[rsp]`
- `pop rbx` → reads `[rsp]` into `rbx`, then `rsp += 8`
- to assemble `a*100 + b*10 + c`, use `imul` and `add`
