# Koan 12: Equal Branch

**Goal**: If `rax == 10`, exit with 1. Otherwise exit with 0. Try both paths.

**Practice**: `cmp` + `je` (or `jne`).

**Success**: with `rax` initialized to 10, exit 1. With any other value, exit 0.

---

**Hints**:
- `cmp rax, 10` sets flags based on `rax - 10` but doesn't change `rax`
- `je label` jumps if the zero flag is set (i.e., equal)
- shape: `cmp` → `je equal_case` → `mov rdi, 0` → `jmp done` → `equal_case: mov rdi, 1` → `done: syscall`
