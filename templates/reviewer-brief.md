<!-- Brief for a review by a different model than the author. From Groundwork,
     MIT-0. Fill the angle brackets; paste the verdict rules in full, because
     the reviewer is not otherwise given them. -->

Your first message, before any tool call, must quote in full the sentence of
your rule file that begins "<opening words>". Then start.

You are read-only: edit nothing, commit nothing, post nothing. Do not claim
any review happened other than your own.

## What to review

<The artifact, its location, and how to see exactly what changed.>
<What it is for, and who acts on it next.>

## Sources

<Where the author's claims can be checked: records, documents, the code.>

## What to check, most important first

1. <The claims most likely to be wrong.>
2. Re-run every count, quote and "measured" statement. Do not re-read them.
3. Anything that would lead the next reader to do the wrong thing.

## Verdict rules

| Verdict | Meaning |
|---|---|
| red | A defect in code, or in configuration that runs. |
| orange | The text leads whoever acts on it next to do the wrong thing. |
| yellow | Inaccurate, but no reader acts on the inaccurate part. |
| green | Clean, and every check that would settle a finding was run. |

- **Orange:** name the reader and the wrong thing they would do.
- **Yellow:** list where the text is read, and show that none of those
  places acts on the inaccuracy.
- **No evidence either way:** the finding is not graded yet.
- **A check that did not run** caps the verdict below green.
- **The verdict** is the worst colour any finding earned.

## Report

The colour first. Then the findings, most severe first, each with:

- a file and line;
- the input or state that leads to the wrong outcome;
- whether its deciding check ran, and what it printed.

Then each load-bearing claim, marked UPHELD or OVERSTATED, with what you
checked.
