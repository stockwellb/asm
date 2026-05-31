# Project 1: FizzBuzz

**Goal**: Print the numbers `1` through `100`, one per line — but for multiples of 3 print `Fizz`, for multiples of 5 print `Buzz`, and for multiples of both print `FizzBuzz`.

**Why this one first**: it introduces no new syscalls. Everything it needs you already drilled — a counting loop (14/15), modulo (06), branching (12/13), and printing a computed number with `itoa` (28). It's the gentlest jump from koan to program, and it forces you to actually *use* `itoa` in anger.

**Success**: running it prints exactly the FizzBuzz sequence for 1–100. Spot-check: lines 3/5/15 say `Fizz`/`Buzz`/`FizzBuzz`, line 100 says `Buzz`.

---

Build it in stages, test each before moving on.

**Stage 1 — count and print.** Loop `1..100`, print each number with a newline using your `itoa` (lift it in as a subroutine). Get this clean first — it's the whole skeleton.

**Stage 2 — the Fizz/Buzz logic.** For each number:
- compute `n mod 3` and `n mod 5` (recall koan 06: `div` puts the remainder in `rdx`; `xor rdx, rdx` before each `div`).
- the classic ordering: check `mod 3 == 0 && mod 5 == 0` **first** (→ `FizzBuzz`), else `mod 3 == 0` (→ `Fizz`), else `mod 5 == 0` (→ `Buzz`), else print the number. Getting the order wrong is the usual bug.

**Hints**:
- keep the `"Fizz"`, `"Buzz"`, `"FizzBuzz"` strings in `.data` with their lengths (`equ $ - label` trick from koan 21), and `write` the right one.
- the loop counter must survive across your `call itoa` / `call`s — park it in a callee-saved register (koan 19), or it'll get trampled.
- a newline is byte `10`; you can `write` it separately or bake it into each string.
