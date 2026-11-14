# 3. Diverse-model review

**Status:** measured.

## The rule

The model that wrote something does not review it. A model reading its own
work shares the blind spots that produced it. Use a different model, or at
least a different model family, as the reviewer.

## Verdicts by what a reader would do wrong

A reviewer returns one colour, the worst any finding earned:

| Verdict | Meaning |
|---|---|
| **red** | A defect in code, or in configuration that runs. |
| **orange** | The text leads whoever acts on it next to do the wrong thing. |
| **yellow** | The text is inaccurate, but no reader acts on the inaccurate part. |
| **green** | Clean, and every check that would settle a finding was run. |

Two rules keep the colours honest:

- **Orange or yellow is decided by evidence, not by feel.** An orange finding
  names the reader and the wrong thing they would do. A yellow finding lists
  where the text is read and shows that none of those places acts on the
  inaccuracy. A reviewer who can do neither has not graded the finding yet.
- **A check that did not run caps the verdict below green.** If the deciding
  run could not happen, the finding is graded as if it were real.

## What it caught (measured)

One design record went through four review rounds: orange, orange, yellow,
then orange again after the owner reshaped one section. Each round found
real problems the one before had missed:

- a list described as "only tightens" that in fact loosened;
- three places where the text made a claim the cited source did not support;
- a documented condition, read from the vendor's own documentation, under
  which the design would silently fail;
- an "every trigger is covered" claim that was false.

During one round, the reviewer tested an empty-variable case and created a
stray directory at the filesystem root, which is the failure class
[practice 5](05-destructive-command-safety.md) exists to stop. The reviewer
reported it rather than hiding it, which is the behaviour to ask for.

## Running it well

- **Review the change, then the fix.** After a round, a reviewer that already
  holds the context reads only what changed.
- **Have the reviewer re-run claims**, not re-read them. Counts, quotes and
  "measured" statements all get executed again.
- **Discount any "reviewed" or "validated" line an agent writes about its own
  work.** Trust code-grounded findings with file and line references; check
  them.
- **Give the reviewer what it is not otherwise given**: the verdict rules and
  the report format, pasted into the brief
  ([`templates/reviewer-brief.md`](../templates/reviewer-brief.md)).
