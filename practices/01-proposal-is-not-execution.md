# 1. Proposal is not execution

**Status:** the tiers are believed; the list-drift failures below are measured.

## The rule

An agent's analysis, plan, recommendation or draft changes nothing. Only an
approved plan touches real state: files that ship, settings, other people's
systems, anything that cannot be taken back. Approval is explicit and
current. Silence is not approval, and neither is a "yes" given to a
different question.

## Three tiers

Every choice an agent meets falls into one of three tiers.

1. **Rule-covered.** A ruling the person already gave covers this choice, and
   the choice goes in the same or a stricter direction. The agent makes it,
   logs it, and a different model reads the log.
2. **LEAN.** No ruling covers it, but the choice only tightens, one option is
   clearly right, and nothing on the list below applies. The agent shows the
   person a card *before* it takes effect and proceeds unless they object.
3. **FORK.** Everything else. The agent shows a card and waits.

## Always a FORK

These never go out as LEAN, even when an earlier ruling seems to cover them:

1. Loosening security: a default, gate, check, limit or refusal.
2. Any change to an enforcement default, stricter or looser.
3. A new dependency.
4. A change to a trust boundary, a security boundary, an authority rule or
   consent, including removing something a user agreed to.
5. Anything that needs an architecture record or sets a pattern later code
   must follow.
6. A schema or data-model change.
7. An irreversible or destructive step.
8. Keys and secrets.
9. Installer behaviour on the person's machines.
10. Anything that changes what users see about security.
11. An architectural choice.
12. Amending a rule or plan the person approved.
13. New scope or a new boundary, beyond anything already approved.
14. Loosening an existing feature, not only a protection.
15. Anything that would need significant rework to undo.
16. A precedent for later work.
17. A change to the user experience where the agent is unsure which way the
    person would go.

Adapt the list to your project. Keep **one** copy of it.

## Why one list (measured)

The project once had three overlapping lists: one in the main rule file, one
in the decision skill, and one in a guide of the owner's rulings. They had
drifted apart. Merging them was meant to "only tighten", and review after
review found it did not:

- The first merge dropped "enforcement defaults", so a stricter default
  would have gone out as LEAN.
- A second review found two triggers that already bound the agent were
  missing: "architectural choices" and "amending an approved rule or plan".
- Checking the claim "every trigger is covered" found two more.
- A later review against the owner's own interview answers found five more.

Each gap meant an agent could proceed alone on a choice the person had said
comes to them. One list, checked trigger by trigger against every source,
is the fix.

## Adopting it

- Write the list once, in the rule file every agent reads
  ([`templates/AGENT-RULES.md`](../templates/AGENT-RULES.md)).
- Record each ruling in the person's own words, with a date
  ([practice 7](07-honest-status.md)), so "rule-covered" can be checked.
- Start strict. Moving a kind of choice down a tier is itself a FORK.
