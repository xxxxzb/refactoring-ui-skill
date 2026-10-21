# Quick Card

> A one-page fast path for a single component or a small screen. It condenses the systems and the highest-cost rules; the full reference always wins on a conflict.
>
> Adapted from the MIT-licensed `s0xDk/refactoring-ui-skill`. Load this instead of the chapter files when the task is small, and load the specific chapter only when a finding is disputed.

---

## The systems

**Spacing and sizing.** Base 16, non-linear:

```
4  8  12  16  24  32  48  64  96  128  192  256  384  512  640  768
```

No two adjacent values closer than ~25%. Use it for margin, padding, width, height, icon size, border width. `§3.2`

**Type scale.** Hand-picked, `px` or `rem`:

```
12  14  16  18  20  24  30  36  48  60  72
```

Never `em` for font sizes — it compounds through nesting. `em` is correct for measure, where the width should track the text. `§4.1.2`

**Weights.** Two: 400/500 normal, 600/700 emphasis. Never below 400 in UI text. `§2.2.b`

**Colors.** 8–10 greys, 5–10 shades per primary and accent. Author in HSL. Build `500` first, then `900/100`, then `700/300`, then `800/600/400/200`; raise saturation away from 50% lightness and rotate hue no more than 20–30°. Never `lighten()` / `darken()` at the point of use. `§5.3`

**Elevation.** Five shadows, chosen by z-position:

```
sm   0 1px 3px   hsla(0,0%,0%,.2)    buttons
md   0 4px 6px   hsla(0,0%,0%,.2)    dropdowns
lg   0 5px 15px  hsla(0,0%,0%,.2)
xl   0 10px 24px hsla(0,0%,0%,.2)
2xl  0 15px 35px hsla(0,0%,0%,.2)    modals
```

**Radius.** Pick one and hold it. 0 = formal, 4–6px = neutral, 12px+ = playful. `§1.4.3`

**Line-height and measure.** Line-height falls as type grows and rises with line length. Body 45–75 characters; large headlines can sit near 1. `§4.3 §4.5`

**Opacity.** Fixed set (`.05 .1 .2 .4 .6 .8`), not a slider per component. `§1.5`

---

## The ten hard rules

1. **Never grey text on a colored background.** Hand-pick the background's hue with adjusted saturation and lightness. Never white at reduced opacity. `§2.3`
2. **Never `em` for the type scale.** `px` or `rem`; `em` only for measure. `§4.1.2`
3. **Never generate shades at runtime.** Define the ramp up front. `§5.3`
4. **Fixed widths for fixed things.** Sidebars get a width; content gets a max-width and shrinks only below it. `§3.4.1 §3.4.2`
5. **Large elements shrink faster than small ones.** Set sizes per breakpoint; never scale the whole page proportionally. `§3.5`
6. **Space around a group must exceed space within it.** This is the fix for "which label belongs to which field" and for every ambiguous grouping. `§3.6`
7. **Never use color as the only signal.** Pair it with an icon, text, shape or lightness difference. `§5.7`
8. **Contrast:** 4.5:1 for normal text; 3:1 for large text, defined as **24px regular or 18.66px bold**; 3:1 for the non-text parts that identify a control — input outline, checkbox edge, focus ring. Decorative dividers and disabled controls are exempt; placeholders are not. `§5.6`
9. **Don't scale an icon far from its intended size.** A 16–24px icon at 48px looks chunky; put it in a colored shape instead. `§7.3.1`
10. **One personality across four decisions:** typeface, primary color, radius and language. They must agree. `§1.4`

---

## The procedure

1. **Start with a feature, not a shell.** Design the real functionality before nav, container or logo. `§1.1`
2. **Work in grayscale first.** Let spacing, size and contrast carry the hierarchy before color. `§1.2.1`
3. **Rank the content** into primary / secondary / tertiary; rank actions into one primary, a few secondary, several tertiary. `§2.1 §2.8`
4. **Lay out from the scale.** Every value from a system; outer space > inner space. `§3.2 §3.6`
5. **Set the measure and rhythm.** 45–75 characters; line-height matched to size and width. `§4.3 §4.5`
6. **Then color, depth, polish** — in that order. `§5 §6 §8`
7. **Verify at 1280 and 375**, and read the copy aloud. `SKILL.md` → Visual verification

---

## "It looks off" — check these first

| Check | Rule |
|---|---|
| Can I name the single most important element? | `§2.1` |
| More than three text colors, or more than two weights? | `§2.2.a §2.2.b` |
| Grey text on a colored panel? | `§2.3` |
| Is space around a group larger than space within it? | `§3.6` |
| Any off-scale spacing, font size, radius or shadow? | `§1.5 §3.2 §4.1 §6.2.1` |
| Measure outside 45–75 characters? | `§4.3` |
| More than one primary-looking action? | `§2.8` |
| Shadows written per component instead of chosen from the five? | `§6.2.1` |
| Contrast below 4.5:1, or color carrying meaning alone? | `§5.6 §5.7` |
| Every component rendered as its library default? | `§8.6` |
| Any headline or CTA that reads like a model wrote it? | `§18.2 §18.5.1` |
| Does the personality match the product across type, color, radius and language? | `§17.1 §17.2` |

If more than two of these fail, stop the quick pass and run Workflow D with `13-audit-rubric.md`.

---

## Starter tokens

`assets/starter-tokens.css` is a complete, pre-filled starting set: spacing, type, weights, five elevations, a 9-shade cool grey ramp, a primary, three accent trios, semantic roles and a dark-mode block. Every text pair is verified at 4.5:1; functional borders meet 3:1. Copy it and retune the hues. For a palette built from the project's actual brand color, run Workflow A instead.

## Cross-references

- Full rule text → the chapter file for the cited number
- Audit procedure → `13-audit-rubric.md`
- Token generation → `11-design-tokens.md`
- Component recipes → `12-component-recipes.md`
- Copy → `18-copy.md`
- Brand personality → `17-brand-personality.md`
