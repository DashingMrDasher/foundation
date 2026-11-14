# 6. Instructions that arrive

**Status:** the injection probe and the drift problem are measured; the
cross-repository layout is believed (newly adopted).

## Rules only work if they reach the agent

An agent follows the rule file it was given, not the one you meant to give
it. Two things go wrong quietly: the file stops being loaded, and copies of
it drift apart.

## Prove the rules arrived: the tripwire

Every brief for a spawned agent names the opening words of one sentence in
the rule file. The agent's first message, before any tool call, must quote
that sentence in full. A small script checks the quote against the file.

If a tool update ever stops loading the rule file, the very next spawn fails
the check, instead of the agent working without its rules for weeks. Use a
sentence that appears nowhere else the agent can see, such as its brief,
or the check proves nothing ([practice 4](04-controls-on-every-check.md)).

When the rules are split across files, quote one sentence from each file.

## One shared file, one per-project file

For several repositories under one owner:

- **`AGENT-RULES.md`** (or your tool's name for it): the rules that apply
  everywhere. One repository holds the canonical copy. The others hold
  copies that a check verifies by hash.
- **`PROJECT.md`**: the rules for this repository only. It is never copied.
- Every name your tools read (`CLAUDE.md`, `AGENTS.md`, `.cursorrules` and
  the rest) is a **symlink** to the shared file. A symlink cannot drift.

The shared file points to `PROJECT.md` twice, so both kinds of tool find it:

- With an import line, for tools that expand imports. In Claude Code, that
  is `@PROJECT.md`.
- With a plain sentence: "This repository's own rules are in `PROJECT.md`.
  If it is not already in your context, read it before working."

**Test it before relying on it (believed, not yet measured).** Claude Code's
documentation says an import resolving outside the working directory needs a
one-time approval, and stays off if declined. A session started in a
subdirectory may therefore not load `PROJECT.md`. Start a session in a
subdirectory, list what it loaded, and see. Until then, the plain sentence
is the guaranteed path.

## One copy of the truth

State each fact once and link to it everywhere else. Every copy of a rule is
a future contradiction. The list-drift story in
[practice 1](01-proposal-is-not-execution.md) is what that looks like when
it happens.
