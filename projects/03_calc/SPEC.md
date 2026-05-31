# Project 3: calc (a tiny calculator)

**Goal**: A command-line calculator that takes `number operator number` and prints the result. `./solution 6 x 7` prints `42`. Support `+`, `-`, `x` (multiply), and `/` (integer divide).

**Why this one last**: it's the synthesis. No new syscalls — instead it leans hard on parsing and dispatch. You read three args (29), turn the numbers into integers with `atoi` (30), branch on which operator was given, do the arithmetic (03–05), and print the result with `itoa` (28). It's small but it's a *real* program with input parsing and a dispatch table.

**Success**:
- `./solution 6 x 7` → `42`
- `./solution 100 - 58` → `42`
- `./solution 84 / 2` → `42`
- `./solution 40 + 2` → `42`

---

**Why `x` and not `*`**: the shell expands `*` into a list of filenames before your program ever sees it. Using `x` (or quoting `'*'`) sidesteps that. Worth understanding *why* — it's a real-world gotcha, not assembly's fault.

**Stages**:

**Stage 1 — parse the two operands.** `argv[1]` and `argv[3]` are the numbers; run each through your `atoi` subroutine (from koan 30) into two registers.

**Stage 2 — dispatch on the operator.** `argv[2]` is a pointer to a 1-char string, so the operator is its **first byte**: `mov al, [ptr]`. Compare `al` against `'+'`, `'-'`, `'x'`, `'/'` and jump to the matching arithmetic. (This is a hand-written jump table — the foundation of every `switch`/`match`.)
- `+` → `add`, `-` → `sub`, `x` → `imul`, `/` → `div` (mind the `rdx:rax` setup and `xor rdx, rdx` from koan 05).

**Stage 3 — print the result** with `itoa` (28) and a newline.

**Hints**:
- structure the arithmetic as a clean dispatch: compare, `je` to a small label per operator, each label computes into `rax` and jumps to a shared "print" label.
- keep operands in registers that won't be clobbered by your `call atoi` calls (callee-saved, koan 19) — parse *both* before you start the second, or stash the first.
- you can assume clean input (two valid integers, a known operator). No need to handle negative results yet, though `-` can produce them — a fair stretch goal is signed printing.
- **stretch goals** once it works: handle negative results (print a leading `-`), reject unknown operators with a stderr message, or extend to read an expression from stdin instead of argv.
