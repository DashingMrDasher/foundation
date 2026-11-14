# 2. Decision cards

**Status:** the format is believed and on trial; the delivery failure below
is measured.

## The problem

Bring a person a decision with too much detail and they drown. Bring too
little and they cannot tell what you are asking. One project's owner swung
between a two-section format and a four-section one before naming the real
problem: some cards overwhelmed him with detail, and others left him unsure
what was being asked. The format was never the issue. The amount was.

## The card

```
decide D-123: <the question, in one line>
FORK · since 2026-11-10

Break: Where this sits: <one plain orientation line>. What is wrong or
undecided, and what it blocks.

Fix: The recommendation, and why.
  considered: <option>, rejected because <reason>
  stays failed: <what happens if this goes wrong and stays wrong>
  undo: <the exact revert>

Reply: Y, or say what to change.
```

- **The first read is short:** about eight lines. Evidence, commands and
  longer reasoning go below a fold. On GitHub that is a collapsed `<details>`
  block; in chat, the person asks for more.
- **The orientation line is never skipped.** A short card without it is the
  one nobody can answer.
- **Rejected options stay visible**, one line each. A recommendation-only
  card that hides its alternatives is a card that cannot be checked.
- **"Stays failed" is required.** It is the line that shows the cost of being
  wrong.
- **Too big to fit means two decisions.** Split the card; do not squeeze it.

## Delivering it

- **In a tool with a question widget, put the whole card inside it.**
  Measured: an agent wrote a list in chat and then opened the question
  widget. The person approved "the list shown in chat", which the widget had
  hidden, and the list itself was wrong. The card had to be asked again.
- **In voice mode** (driving, walking): at most three spoken sentences, what
  is undecided, the recommendation and the main risk. Post the written card
  at once, and keep any card that needs evidence to judge for a screen.
- **Record the answer where every session can find it**, in the person's
  words ([practice 7](07-honest-status.md)).

## Tuning it

Run it as a trial: the person marks any card `heavy` or `thin`, and the
length cap moves from those marks rather than from anyone's guess.
