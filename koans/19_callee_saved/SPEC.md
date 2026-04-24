# Koan 19: Callee-Saved Register

**Goal**: In the System V AMD64 ABI, `rbx` is callee-saved — if a function touches it, that function must restore it. Simulate: initialize `rbx = 42`, save it, overwrite it with junk, restore it, exit with `rbx` (still 42).

**Practice**: the prologue/epilogue pattern you'll reuse in every function.

**Success**: `echo $?` prints `42`.

---

**Hints**:
- prologue: `push rbx`
- body: `mov rbx, 0xDEAD` (or any junk)
- epilogue: `pop rbx`
- callee-saved set on SysV AMD64: `rbx`, `rbp`, `r12`–`r15`, `rsp`. Everything else is caller-saved (volatile across calls).
