# Gold set — evaluation

9 browser-openable fixtures for **Workflow D (diagnose only)**, plus a trigger set. The fixtures are deliberately flawed; `expected.json` says which findings must appear and which must not.

```bash
uv run python eval/score.py --self-check
uv run python eval/score.py --dir eval/runs/<run-id>
uv run python eval/summarize.py eval/runs/<run-id>
open eval/runs/<run-id>/index.html
```

Paths are relative to this skill directory (`~/.agents/skills/refactoring-ui`).

## The suite

| id | Surface | What it tests |
|---|---|---|
| `01-settings` | Account settings | Three solid buttons including a destructive primary; grey on teal; form group spacing |
| `02-login` | Sign-in | **P0 group spacing** (label as close to the previous field as to its input); two primaries; raised inputs |
| `03-empty` | Empty project list | Disabled filters/headers that should be hidden; missing CTA; "nothing yet" vs "nothing matched" |
| `04-stats` | Metric cards | Label larger than the value; modal-level shadow on a static card |
| `05-landing` | Marketing home | Teal brand overridden by an indigo→pink gradient; four filled CTAs |
| `06-article` | Help article | Measure far past 45–75 characters; long text centered |
| `07-hero` | Hero over a light photo | White text on a light image with no overlay — **must be seen rendered** |
| `08-blotter` | Payment blotter | **Restraint test:** the density is deliberate. Reporting "not enough whitespace / §3.1" is a false positive |
| `09-copy` | Billing settings | AI-write tells, a bare error, a "No data" empty state, and an ambiguous destructive confirmation |

The product is **Lumen** (an invoicing tool) with an existing primary of `#0f766e`. Changing it to indigo is a false positive, not a fix.

Each case:

```
eval/cases/<id>/index.html     # open this
eval/cases/<id>/expected.json  # must / should / forbidden
```

- **must** — miss one, the case fails.
- **should** — recall only; a miss does not fail.
- **forbidden** — citing it as a defect fails the case.

Field meanings: [SCHEMA.md](SCHEMA.md).

## Pass bar

1. **9/9 must hits**, and `08-blotter` has no density false positive → suite PASS.
2. Track should-recall as a trend; no threshold.
3. Trigger accuracy is scored separately.

Do not replace this with "the report felt reasonable."

## Running it manually

1. Use a **fresh session** per case. The authoring conversation carries context that hides instruction gaps.
2. Paste only the `prompt` field from `expected.json`. Do not paste the file itself.
3. Ask for Workflow D: detect the stack → render if possible → nine lenses → finding table, every row carrying a `§` ID.
4. Save the full report as:

```
eval/runs/<run-id>/01-settings.md
eval/runs/<run-id>/02-login.md
...
```

The filename must equal the case id; the scorer aligns on it.

5. Score:

```bash
uv run python eval/score.py --dir eval/runs/<run-id>
```

`score.py` scans only lines that contain both a severity (P0/P1/P2) and a `§` ID. Prose that mentions a rule in a "not a finding" section does not count.

Exit code: `0` when everything passes, `1` on any failure.

## Baseline comparison

Run the same prompt twice, in two fresh sessions: once with the skill installed, once without. Compare must-hit recall and false positives, not prose length. This is the only way to tell whether the skill is doing work.

## Triggers

`triggers.json` holds 8 should-trigger and 7 should-not-trigger prompts. A trigger counts when the agent reads `SKILL.md` or explicitly follows its routing/workflows. "It said something sensible about UI" does not count.

## Adding a case

1. Put the fixture in `eval/cases/<id>/index.html`.
2. Write `expected.json` with `must`, `should`, `forbidden`.
3. Add the prompt to `triggers.json` if it is a trigger test.
4. Run `uv run python eval/score.py --self-check`.
5. Confirm the new case fails against a deliberately empty report and passes against a hand-written correct one.

## Limits

The scorer is lexical: it checks whether the report cites an expected rule ID in a finding row. It measures coverage of the intended diagnosis, not whether the proposed fix is good design. Read the reports.
