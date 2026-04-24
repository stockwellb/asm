# Koan 10: Shift Right

**Goal**: Exit with `64 >> 2` (i.e., 16).

**Practice**: `shr` — right shift is division by powers of 2.

**Success**: `echo $?` prints `16`.

---

**Hints**:
- `shr rax, 2` shifts `rax` right by 2 bits (logical shift, fills with 0)
- for signed values use `sar` (arithmetic shift, preserves the sign bit)
