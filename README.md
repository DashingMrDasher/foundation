# Groundwork

Practices for building good software with AI coding agents.

These come from months of building a security product where AI agents write
most of the code and one person owns every decision. Each practice is here
because something went wrong without it. Where that happened, the failure is
described, with the project's specifics removed.

## Measured or believed

Every practice is marked:

- **Measured:** the failure happened, and the practice caught it or would
  have, with a record to show for it.
- **Believed:** sound reasoning, not yet tested against a real failure.

Adopt the believed ones as experiments, not as settled fact. The guide holds
itself to its own rule 4: a claim needs a check that could have failed.

## The practices

| # | Practice | In one line | Status |
|---|---|---|---|
| 1 | [Proposal is not execution](practices/01-proposal-is-not-execution.md) | An agent's plan changes nothing; three tiers decide what it may do alone. | Partly measured |
| 2 | [Decision cards](practices/02-decision-cards.md) | Bring a person a choice they can answer in one read. | Partly measured |
| 3 | [Diverse-model review](practices/03-diverse-model-review.md) | The model that wrote it does not review it. | Measured |
| 4 | [Controls on every check](practices/04-controls-on-every-check.md) | A check proves nothing until it has been seen to fail. | Measured |
| 5 | [Destructive-command safety](practices/05-destructive-command-safety.md) | Guard every path a delete touches; rules advise, hooks stop. | Measured |
| 6 | [Instructions that arrive](practices/06-instructions-that-arrive.md) | Prove the rules reached the agent, and keep one copy of them. | Partly measured |
| 7 | [Honest status](practices/07-honest-status.md) | Say what ran, what did not, and who said what. | Measured |

**Where to start:** practices 4 and 5. They cost almost nothing and catch the
failures that do the most damage quietly.

## Templates

`templates/` holds files to copy into your own repositories:

| File | Use |
|---|---|
| [`AGENT-RULES.md`](templates/AGENT-RULES.md) | A shared rule file for every repository, pointing to a per-project file |
| [`PROJECT.md`](templates/PROJECT.md) | The per-project rules that sit beside it |
| [`decision-card.md`](templates/decision-card.md) | The Break / Fix card |
| [`reviewer-brief.md`](templates/reviewer-brief.md) | A brief for a review by a different model |
| [`pr-body.md`](templates/pr-body.md) | A pull request body that states what ran and what did not |
| [`safe-tempdir.sh`](templates/safe-tempdir.sh) | The temporary-directory pattern from practice 5, with its own test |

## License

- The guide's text is licensed under [CC BY 4.0](LICENSE): reuse it with
  credit to Synergy Geeks.
- The templates are licensed under [MIT-0](templates/LICENSE): copy them into
  your projects freely, with no notice needed.
