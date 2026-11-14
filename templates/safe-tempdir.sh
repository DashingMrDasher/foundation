#!/usr/bin/env bash
# safe-tempdir.sh: a temporary directory that cannot turn into "delete everything".
# The pattern from Groundwork practice 5. Copy freely (MIT-0, see LICENSE).
#
#   make_workdir [BASE]   prints a new directory under BASE (default: $TMPDIR or /tmp)
#   --self-test           runs the good and bad cases and reports each
#
# Use it like this:
#
#   local work
#   work="$(make_workdir)"                      # declare first, assign second
#   trap 'rm -rf -- "${work:?}"' EXIT           # the :? refuses an empty path
#
set -euo pipefail

make_workdir() {
  local base dir
  # ${1-...} without a colon: an explicitly empty BASE stays empty, so the
  # check below refuses it instead of silently falling back to /tmp.
  base="${1-${TMPDIR:-/tmp}}"
  # Why: mktemp under an empty base would create the directory at the root.
  [[ -d "${base:?base directory is empty}" ]] || {
    printf 'make_workdir: not a directory: %s\n' "$base" >&2
    return 1
  }
  dir="$(mktemp -d "${base}/work.XXXXXX")" || return 1
  printf '%s\n' "$dir"
}

self_test() {
  local scratch dir failures=0
  scratch="$(mktemp -d)" || return 1

  # Negative controls: each bad case must be refused.
  if (make_workdir "" >/dev/null 2>&1); then
    printf 'FAIL: an empty base was accepted\n'; failures=$((failures + 1))
  else
    printf 'ok:   an empty base is refused\n'
  fi
  if (make_workdir "${scratch}/missing" >/dev/null 2>&1); then
    printf 'FAIL: a missing base was accepted\n'; failures=$((failures + 1))
  else
    printf 'ok:   a missing base is refused\n'
  fi

  # Positive control: a good base yields a new directory inside it.
  dir="$(make_workdir "$scratch")"
  if [[ -d "$dir" && "$dir" == "$scratch"/work.* ]]; then
    printf 'ok:   a good base yields %s\n' "$dir"
  else
    printf 'FAIL: no directory under the good base\n'; failures=$((failures + 1))
  fi

  # The trap removes the directory when the shell that made it exits.
  dir="$( (w="$(make_workdir "$scratch")"; trap 'rm -rf -- "${w:?}"' EXIT; printf '%s' "$w") )"
  if [[ -n "$dir" && ! -e "$dir" ]]; then
    printf 'ok:   the EXIT trap removed %s\n' "$dir"
  else
    printf 'FAIL: the EXIT trap left %s\n' "$dir"; failures=$((failures + 1))
  fi

  rm -rf -- "${scratch:?}"
  printf '%d failure(s)\n' "$failures"
  [[ "$failures" -eq 0 ]]
}

if [[ "${BASH_SOURCE[0]}" == "$0" && "${1-}" == "--self-test" ]]; then
  self_test
fi
