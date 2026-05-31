# Koan 27: Call and Return

**Goal**: Write a real subroutine `add_two` that takes two arguments and returns their sum. From `_start`, call it with `7` and `35`, then exit with the result. `echo $?` prints `42`.

**Practice**: `call`/`ret`, the System V argument convention, and the fact that `call` pushes a return address the `ret` pops back off.

**Success**: `echo $?` prints `42`.

---

**Hints**:
- the convention: first arg in `rdi`, second in `rsi`, **return value in `rax`**
- `call add_two` pushes the address of the next instruction onto the stack, then jumps to the label
- `ret` pops that address and jumps back to it — so every `call` needs a matching `ret`
- the subroutine: `add_two:` / `mov rax, rdi` / `add rax, rsi` / `ret`
- in `_start`: load `rdi` and `rsi`, `call add_two`, then the answer is in `rax` — move it to `rdi` and exit
- mental check: `rsp` should be back where it started after the `call`/`ret` pair. If you `push` inside the subroutine, you must `pop` before `ret`, or `ret` will jump to garbage.
