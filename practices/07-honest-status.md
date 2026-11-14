# 7. Honest status

**Status:** measured.

## Say what ran

Every pull request, commit message and report says which checks ran, which
did not, and why. "Not run" is a valid state. "Should work" is not.

> Gates: the one test that reads these files passed. Formatting, lint, the
> full test suite and the dependency audit were **not** run: this cloud
> container's disk cannot hold a full build. They run on the workstation
> before merge.

A missing green check is not a passing one.

## Say who said what

- Quote the person's rulings **verbatim**, with the date. An agent's
  paraphrase of a ruling is not the ruling. (Measured:
  [practice 4](04-controls-on-every-check.md) shows a paraphrase that
  quietly widened a rule.)
- Mark text the agent drafted, such as "(drafter)", so a reader can tell a
  decision from a suggestion.
- When the agent fills a gap the person did not rule on, say so on that
  line.

## Keep records where every session can find them

Measured: the record of one important interview with the owner lived only on
one workstation. A later session, asked to align a design with "the decision
interview we did yesterday", could not find it. It aligned to an older
record, said plainly that it had done so, and the design had to be revised
once the interview was posted where every session could read it.

Records belong in the shared tracker or the repository, never in one
machine's scratch space.

## Correct in place, visibly

When a claim turns out wrong, fix it where it lives and say so: "corrected
on 2026-11-10; the earlier text said X". Do not delete it quietly. A
correction that hides is how the next reader repeats the mistake.
