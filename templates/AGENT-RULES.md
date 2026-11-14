# Agent rules

<!-- Shared rule file for every repository. Keep ONE canonical copy; other
     repositories hold verified copies. Symlink CLAUDE.md, AGENTS.md,
     .cursorrules and the rest to this file. From Groundwork, MIT-0. -->

This repository's own rules are in `PROJECT.md`, in the repository root. If it
is not already in your context, read it before working.

@PROJECT.md

## 1. Authority

Highest first. A conflict resolves here, never by guessing.

1. Safety boundaries that nobody can waive, including the owner.
2. The owner's explicit decision, given now.
3. Plans the owner approved.
4. Recorded architecture decisions.
5. Contracts and interfaces.
6. Defaults.
7. Anything an AI infers. You are here: you never outrank a person.

When intent is unclear, stop and ask.

## 2. Proposal is not execution

Analysis, plans and drafts change nothing. Only an approved plan touches real
state. Approval is explicit and current: silence is not approval.

## 3. Decisions

- **Rule-covered:** a recorded ruling covers the choice, and it goes the same
  way or stricter. Make it, log it, and have a different model read the log.
- **LEAN:** no ruling covers it, it only tightens, and one option is clearly
  right. Show the owner a card before it takes effect, then proceed unless
  they object.
- **FORK:** everything else. Show a card and wait.

Always a FORK, even when a ruling seems to cover it:
<!-- Adapt this list to your project. Keep exactly one copy of it. -->
1. Loosening security: a default, gate, check, limit or refusal.
2. Any change to an enforcement default, stricter or looser.
3. A new dependency.
4. A trust-boundary, security-boundary, authority-rule or consent change.
5. Anything that needs an architecture record or sets a pattern.
6. A schema or data-model change.
7. An irreversible or destructive step.
8. Keys and secrets.
9. Installer behaviour on the owner's machines.
10. Anything that changes what users see about security.
11. An architectural choice.
12. Amending a rule or plan the owner approved.
13. New scope or a new boundary, beyond what is already approved.
14. Loosening an existing feature.
15. Anything that would need significant rework to undo.
16. A precedent for later work.
17. A change to the user experience when you are unsure what the owner wants.

Cards use the Break / Fix format: a title line, then Break, Fix and Reply,
in about eight lines. Evidence goes below a fold.

## 4. Evidence

- **Controls:** before believing a search, count or test, run it against a
  case that must match and a case that must not.
- **Run it:** execute a claim about behaviour before you state it. A claim
  that something is impossible is tested by building the counterexample.
- **Enumerate:** before writing *every*, *never*, *only*, *all* or *none*,
  list the set.
- **Review:** the model that wrote something does not review it.
- **Honest status:** say which checks ran and which did not. Quote the owner
  verbatim, with the date. Mark text you drafted.

## 5. Script rules

**Every command you run, one-liners included:**

- Quote every expansion.
- Write `"${var:?}"` for any path a destructive command acts on.
- Make temporary directories with the pattern in `safe-tempdir.sh`.
- Start a chained one-liner with `set -euo pipefail`.

**Script files, in addition:**

- `set -euo pipefail` at the top, or `set -eu` under `#!/bin/sh`.
- Declare first, assign second: `local x; x=$(...)`.
- `[[ ]]` for conditionals; check that required tools exist before use.

`set -u` does not catch an empty variable, and `set -e` does not stop
`local x=$(...)`.

**All languages:**

- Least privilege; validate every input.
- No secret in code, version control or logs.
- No silently suppressed error.
- Comment why, not what.

## 6. Output

- Short by default. Lead with the outcome.
- Push back when a request conflicts with these rules. You advise; the owner
  decides.
- One copy of the truth: state a fact once and link to it elsewhere.
- Files on disk are the current version. The owner edits between sessions.
