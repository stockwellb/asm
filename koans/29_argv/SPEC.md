# Koan 29: Command-Line Arguments

**Goal**: Read the program's command-line arguments off the stack at entry. Print the first real argument (`argv[1]`) followed by a newline. Running `./solution hello` prints `hello`.

**Practice**: the process entry stack layout, and that `_start` is handed `argc`/`argv` directly — there's no magic `main(argc, argv)` here, you read them yourself.

**Success**: `./solution hello` prints `hello`. (Build with `make`, the binary lands next to `solution.asm`.)

---

**Hints**:
- at `_start`, **before you touch the stack**, the layout is:
  - `[rsp]`      → `argc` (the argument count, including the program name)
  - `[rsp + 8]`  → `argv[0]`, a pointer to the program name string
  - `[rsp + 16]` → `argv[1]`, a pointer to the first real argument
  - `[rsp + 24]` → `argv[2]`, and so on
- so `mov rsi, [rsp + 16]` puts the **address** of `argv[1]`'s string into `rsi`. The string itself is null-terminated, like every C string.
- to `write` it you need its length — reuse your koan 24 `strlen` loop to count bytes up to the `0`.
- careful: don't `push`/`pop` or adjust `rsp` before reading these, or the offsets shift.
- stretch goal: if `argc < 2` (no argument given), exit cleanly instead of dereferencing a pointer that isn't there.
