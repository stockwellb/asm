# Koan 04: Multiply

**Goal**: Exit with `7 * 6` (i.e., 42).

**Practice**: `imul` (signed multiply).

**Success**: `echo $?` prints `42`.

---

**Hints**:
- `imul rax, rbx` → `rax = rax * rbx`
- three-operand form is also useful: `imul rax, rbx, 6` → `rax = rbx * 6`
- `mul` exists too, but it has implicit `rdx:rax` semantics — save it for later
