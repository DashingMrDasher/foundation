# 5. Destructive-command safety

**Status:** measured.

## The failure

A public report described an agent deleting a whole repository, `.git`
included, with `find $tmp -delete`. The command that should have set `$tmp`
failed, `$tmp` was empty, and unquoted it vanished from the command line.
`find -delete` with no start path works on the current directory.

## What actually happens (measured, bash 5.2)

- A failed `tmp=$(mktemp -d /missing/dir/XXXX)` still assigns: `$tmp` is set
  to an empty string.
- `set -u` does **not** fire, because the variable is set.
- `set -e` stops a plain assignment like that, but **not**
  `local x=$(...)` or `export x=$(...)`: those report their own success.
- Unquoted, `find $tmp` lists `.` and everything under it. Quoted,
  `find "$tmp"` refuses: `find: '': No such file or directory`.
- `"${tmp:?}"` refuses before the command runs.
- `mktemp -d "$base/name.XXXXXX"` with `$base` empty creates the directory at
  the filesystem root. A reviewer did exactly this by accident while testing.

## The rules

**Every command an agent runs, one-liners included:**

- Quote every expansion.
- Write `"${var:?}"` for any path a destructive command acts on.
- For a temporary directory, use the pattern in
  [`templates/safe-tempdir.sh`](../templates/safe-tempdir.sh).
- Start a one-liner that chains several steps with `set -euo pipefail`.

**Script files, in addition:**

- `set -euo pipefail` at the top. A `#!/bin/sh` script has no `pipefail`, so
  it uses `set -eu`.
- Declare first, assign second: `local d; d=$(...)`.
- `[[ ]]` for conditionals; check that required tools exist before using
  them.

## Rules advise; hooks stop

A rule file is text the agent reads. It is not a wall. What stops a
destructive command mechanically is a hook, or the tool's own safety check.

Measured: during this work, the agent tried to clean up a scratch file with
`rm -f` on a path built from a variable. The coding tool's built-in check
refused to run it. That was the same pattern the rules forbid, caught by
the mechanism rather than by the agent remembering the rule.

Use both: rules, so the agent writes safe commands, and a hook that refuses
`rm -rf` and `find ... -delete` outside a known scratch directory.

## If it happens anyway

- Linked worktrees share one `.git`. If the main checkout's `.git` is
  deleted, the unpushed history of every branch goes with it.
- The worktree directories still hold their files. Re-clone, then copy each
  worktree's changed files back in.
- Push early and often. Pushed work survives a deleted `.git`.
