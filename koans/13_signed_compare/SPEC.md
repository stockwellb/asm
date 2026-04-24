# Koan 13: Signed Compare

**Goal**: If `rax > 5` (signed), exit 1. Otherwise exit 0.

**Practice**: `jg` (signed) vs `ja` (unsigned) — always ask which one you want.

**Success**: with `rax = 10`, exit 1. With `rax = 5`, exit 0. With `rax = -1`, exit 0 (because -1 < 5 signed — but -1 is _huge_ unsigned, so `ja` would get this wrong).

---

**Hints**:
- `jg` = jump if greater (signed) — consults SF/OF/ZF
- `ja` = jump if above (unsigned) — consults CF/ZF
- try both with `rax = -1` to see the bug `ja` would introduce
