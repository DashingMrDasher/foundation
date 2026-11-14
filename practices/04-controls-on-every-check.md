# 4. Controls on every check

**Status:** measured, repeatedly.

## The rule

A check proves nothing until you have seen it fail. Before believing a
search, a count or a test:

- run it once against a case you **know** should match (positive control);
- run it once against a case you **know** should not (negative control).

A search that returns nothing means "absent" or "my pattern is wrong", and
the output alone cannot tell you which.

## Failures it caught (measured)

All of these happened in one working session, and each control caught its
check before a wrong claim shipped:

- **A quote check that counted the checker.** The agent verified that quotes
  in a document matched the person's words by searching the session log. A
  made-up control phrase scored 1, because the search command itself had
  been logged. The raw counts also matched the agent's own drafts. The fix
  was to read only the records the person wrote. Under that check the
  control came back absent, as it should.
- **A pattern that could never match.** A fixed-string search escaped a `*`,
  so it looked for a literal backslash and reported 0 for a line that
  existed. A second search, written correctly, found it.
- **A quote test that could not fail.** To prove an exact-match check
  discriminates, the agent "fixed" one typo in a 361-character quote. The
  altered copy failed to match, which is what showed the check was real.
- **A paraphrase posing as a quote.** A summary wrote "loosens *any* existing
  feature" where the person had said "an existing feature". Checking against
  the verbatim record caught it.

## Two related habits

- **Run the code before stating what it does.** A claim that something is
  impossible is testable too: build the counterexample. If it builds, the
  claim is false.
- **A quantifier needs an enumeration.** Before writing *every*, *never*,
  *only*, *all* or *none*, list the set. Without the list, the honest word is
  weaker: *in the cases checked*.
