# Koan 09: Shift Left

**Goal**: Exit with `1 << 3` (i.e., 8).

**Practice**: `shl` — left shift is multiplication by powers of 2.

**Success**: `echo $?` prints `8`.

---

**Hints**:
- `shl rax, 3` shifts `rax` left by 3 bits
- shifting left by `n` is the same as multiplying by 2^n — but much cheaper than `imul`
