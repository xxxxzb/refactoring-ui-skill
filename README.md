# refactoring-ui

A design rulebook and diagnostic layer for web UI, derived from *Refactoring UI* by Adam Wathan and Steve Schoger, with brand-personality and interface-copy extensions.

Installed at `~/.agents/skills/refactoring-ui`.

## Install

Clone this repository directly into a skills directory. The repository root is the skill root:

```bash
git clone <repository-url> ~/.agents/skills/refactoring-ui
```

For Claude Code, use `~/.claude/skills/refactoring-ui`; for a project-level install, use `.agents/skills/refactoring-ui` inside the project.

## What it does

- **Builds design tokens** — palette generation, contrast checks, Tailwind v3/v4 theme output.
- **Guides a new screen** — personality first, grayscale hierarchy, then color, depth, polish, copy.
- **Refines or audits existing UI** — nine lenses, severity-ranked findings, every finding tied to a rule ID.
- **Writes interface copy** — headlines, CTAs, errors, empty states, confirmations, onboarding.

It is a constraint layer, not an image generator: it decides what a design must obey and checks whether it did.

## Layout

| Path | Contents |
|---|---|
| `SKILL.md` | Index, routing, thirteen laws, four workflows, scope guard |
| `references/01`–`08` | The book's chapters, in rule form (chapter 9 is folded into `SKILL.md`) |
| `references/10` | Tailwind v3/v4 mapping for every rule |
| `references/11` | Token interview, generation algorithm, output contract |
| `references/12` | Component recipes |
| `references/13` | Audit rubric: severity, finding schema, nine-lens sweep |
| `references/14` | Antipatterns: symptom → rule, incl. AI-generated UI |
| `references/15` | Extensions: dark mode, focus, motion, breakpoints |
| `references/16` | Component-library token contracts |
| `references/17` | **Brand personality**, domain anchors, layout/density, component variation |
| `references/18` | **Interface copy**, AI-write tells, errors, empty states |
| `references/19` | **Color psychology**, harmony, culture, saturation |
| `references/20` | **Quick card**: scales, ten hard rules, triage checklist for one component |
| `assets/starter-tokens.css` | Complete, contrast-verified starter set with semantic roles and dark mode |
| `scripts/` | `generate_palette.py`, `check_contrast.py`, `emit_tokens.py` (stdlib only) |
| `examples/` | Three worked before/after audits |
| `eval/` | 9 fixtures, scorer, trigger set, evaluation docs |

`00-coverage-matrix.md` maps all 151 book rules to their files. References 17–19 are extensions; they are labeled as such and are not part of the 151.

## Usage

The skill triggers from its `description`. Typical requests:

```
Review this settings page. Diagnose only.
This page looks off — audit it against design rules.
Set up a type scale, spacing scale, and color ramps for this app.
Write the empty state and error copy for this form.
What should this product feel like? Give me a brand direction.
```

For Workflows C and D, the agent loads `13-audit-rubric.md` first, renders at 1280 and 375 when possible, and returns a finding table. Each row carries a severity and a `§` rule ID.

## Scripts

```bash
uv run python scripts/generate_palette.py --base '#0f7b6c' --json
uv run python scripts/check_contrast.py --pair '#ffffff' '#bd4d28'
uv run python scripts/emit_tokens.py assets/tokens.template.json --format v4 --out dist
```

Python 3.9+, no third-party dependencies. The palette algorithm has a manual fallback in `references/11-design-tokens.md`.

## Evaluation

```bash
uv run python eval/score.py --self-check
uv run python eval/score.py --dir eval/runs/<run-id>
```

See `eval/README.md` for the fixtures, pass bar and trigger set.

## Sources and license

MIT. Rule architecture and reference set adapted from [`edisonmbli/refactoring-ui-skill`](https://github.com/edisonmbli/refactoring-ui-skill); personality and copy material adapted from [`jaywilburn/refactoring-ui-skill`](https://github.com/jaywilburn/refactoring-ui-skill); starter tokens and quick card adapted from [`s0xDk/refactoring-ui-skill`](https://github.com/s0xDk/refactoring-ui-skill). See `ATTRIBUTION.md` and `licenses/`.

This is an unofficial project. It is not affiliated with the book's authors, and it is not a substitute for reading *Refactoring UI*.
