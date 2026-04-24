# Koan 16: Factorial of 5

**Goal**: Compute `5!` (120) with a loop. Exit with the result.

**Practice**: multiplying inside iteration.

**Success**: `echo $?` prints `120`.

---

**Hints**:
- seed: `mov rax, 1`, `mov rcx, 5`
- loop: `imul rax, rcx` / `dec rcx` / `jnz loop` (jnz = jump if not zero)
- counting down and using `jnz` is usually cleaner than counting up and checking equality
