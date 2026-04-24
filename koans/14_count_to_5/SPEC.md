# Koan 14: Count to 5

**Goal**: Starting from 0, increment `rax` in a loop until it equals 5. Exit with the final value (5).

**Practice**: your first counting loop.

**Success**: `echo $?` prints `5`.

---

**Hints**:
- shape: `loop_start: inc rax` / `cmp rax, 5` / `jl loop_start` / (fall through) / `mov rdi, rax` / exit
- or count down — sometimes cleaner
