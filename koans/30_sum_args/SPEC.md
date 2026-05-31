# Koan 30: Sum the Arguments (Grand Capstone)

**Goal**: Read one or more numbers from the command line, add them up, and print the total. Running `./solution 7 35 100` prints `142`. This is the real finale — a tiny but complete program that takes input, computes, and reports a result, with nothing pre-baked.

**Practice**: everything the bridge koans drilled, wired together — argv (29), string→int parsing (the inverse of your itoa from 28), int→string for the output (28), and subroutines to keep it readable (27), all driven by a loop over `argc`.

**Success**: `./solution 7 35 100` prints `142`. Bonus if `./solution` with no args prints `0`.

---

This one is bigger than the others on purpose. Build it in stages and test each before moving on.

**Stage 1 — `atoi` (string → int), the new piece.**
- This is `itoa` run backwards. Walk the string byte by byte; for each digit char, subtract `'0'` (48) to get its value.
- accumulate: `total = total * 10 + digit`. (`imul` by 10, then `add`.)
- stop at the null terminator `0`.
- write it as a subroutine: pointer to the string in `rdi`, return the integer in `rax`, `ret`. Test it alone first — parse one hardcoded string, exit with the value, check `echo $?`.

**Stage 2 — loop over argv.**
- recall the entry stack (koan 29): `argc` at `[rsp]`, `argv[0]` at `[rsp+8]`, `argv[1]` at `[rsp+16]`, ...
- you want to sum `argv[1]` through `argv[argc-1]` (skip `argv[0]`, the program name).
- keep a running total in a **callee-saved** register (e.g. `rbx`, `r12`) so it survives across your `call atoi` — caller-saved registers can be clobbered by a call (this is exactly what koan 19 was warning about).
- watch the syscall/arg registers: `atoi` takes its arg in `rdi`, and you'll want `argc` and your index parked somewhere they won't get trampled.

**Stage 3 — print the total.**
- reuse your `itoa` from koan 28 (lift it in as a subroutine) to turn the sum into ASCII, then `write` it with a trailing newline.

**Notes**:
- test incrementally: get `./solution 5` printing `5` before you trust the loop.
- no negative numbers or input validation required — assume clean integer args.
- when this runs, you've gone from `exit 0` (koan 01) to a real input→compute→output program in pure assembly. That's the whole point.
