# Color Psychology and Palette Direction

> ⚠️ **Extension.** The book teaches how to *build* a palette (`05-color.md`): HSL, shades, saturation, greys, contrast. It does not cover which hues to choose or why. This file covers the choice. Hue associations are cultural and contextual, not universal laws; treat them as starting points and test with the actual audience.

> Load when the question is "what colors should this be", "does this palette fit", or when reviewing a palette that feels generic.

---

## 19.1 Warm and cool

- **Warm** (red, orange, yellow) advances. It reads as closer, more energetic, more urgent.
- **Cool** (blue, green, purple) recedes. It reads as farther, calmer, more stable.

**Rule.** Use temperature to build hierarchy before adding saturation or contrast. `§19.1`

**Why.** A cool page with one warm element creates a focal point with no extra size or weight. The reverse reads as background noise.

**How.** Choose the page temperature from the personality (`17-brand-personality.md`), then place the accent at the opposite temperature for the primary action or the alert.

**Fails as.** A warm page where every element is orange, so nothing is urgent; a cool page whose primary button is another blue.

**Audit severity.** P2 unless the temperature fights the stated brand (P1).

---

## 19.2 Harmony schemes

| Scheme | Hues | Feel | Best for | Risk |
|---|---|---|---|---|
| **Analogous** | Adjacent (blue, blue-green, green) | Cohesive, calm | Content apps, healthcare, meditation | Monotonous without a neutral or accent |
| **Complementary** | Opposite (blue + orange) | Energetic, high contrast | CTAs, marketing, attention | Harsh at full saturation; mute one side |
| **Split-complementary** | One hue + the two beside its complement | Vibrant but balanced | Products needing variety | Harder to keep coherent |
| **Triadic** | Three equidistant (red, yellow, blue) | Playful, vibrant | Creative, children's, gaming | Overwhelming at full strength; one dominant, two accents |

**Rule.** Pick one harmony scheme and derive every non-neutral hue from it. `§19.2`

**Why.** Random hue selection is the most common reason a palette feels assembled rather than designed.

**How.** Most product interfaces are best served by **analogous plus one complementary accent**. Choose the dominant hue first, then the accent, then build ramps with `scripts/generate_palette.py`.

**Fails as.** A blue primary, a green success, a purple feature icon and an orange CTA, all unrelated; a triadic palette at full saturation.

**Audit severity.** P1 when hues conflict with the brand; P2 when the palette is merely uncoordinated.

---

## 19.3 Hue associations

Starting points, adjusted for domain and audience:

| Hue | Associations | Common use | Note |
|---|---|---|---|
| **Blue** | Trust, stability, calm, professionalism | Finance, healthcare, enterprise, social | Universally safe, and therefore overused. Choose it because it fits, not because it is default |
| **Green** | Growth, health, money, nature, success | Fintech, wellness, sustainability, positive states | Pairs with blue for trust + growth; ensure it is distinguishable from success states |
| **Red** | Urgency, energy, passion, danger | Food, entertainment, sale CTAs, errors | A little goes far. Intense as a primary, powerful as an accent |
| **Purple** | Luxury, creativity, mystery | Beauty, premium, creative tools | Machine-generated UI overuses violet. Reach for it only when the domain calls for it |
| **Orange** | Warmth, enthusiasm, friendliness, affordability | Social, education, CTAs, energy | Less aggressive than red, more energetic than yellow; underused in product UI |
| **Yellow** | Optimism, attention, caution, warmth | Highlights, warnings, badges | Hard as a primary on white; keep it for accents and states |
| **Neutrals** | Sophistication, content first | Editorial, portfolios, developer tools | Letting content carry the color is a legitimate, often elegant choice |

**Rule.** Choose the dominant hue from what the product needs to communicate, then verify it against the brand. `§19.3`

**Fails as.** Indigo because no color was specified; purple because it looks "modern"; a red primary on a page with a red error state, so neither reads as urgent.

**Audit severity.** P1 when the hue contradicts the brand or the domain; P2 when it is an unexplained default.

---

## 19.4 Cultural context

Associations vary by culture. These are broad patterns, not rules:

- **White** — purity and cleanliness in much of the West; mourning in parts of East Asia.
- **Red** — danger and stopping in the West; luck and prosperity in Chinese and Indian contexts.
- **Green** — nature and go in the West; religious significance in parts of the Middle East.
- **Yellow** — happiness in the West; mourning in parts of Latin America.

**Rule.** For a global product, verify the palette with the target markets; lean on blues and greens where the audience is mixed. `§19.4`

**Fails as.** A red "success" state for a Chinese audience; a white wedding-themed empty state in a market where white signals mourning.

**Audit severity.** P1 when the product ships in a market where the signal inverts; otherwise informational.

---

## 19.5 Saturation as a lever

Saturation is the fastest way out of the generic AI look.

- **High saturation** — energetic, playful, youthful, attention-grabbing. Consumer apps, children's products, marketing.
- **Low / muted** — sophisticated, calm, mature, professional. Enterprise, healthcare, finance, content.
- **Muted base + one saturated accent** — focus without noise. The workhorse for product UI.

**Rule.** Set the palette's saturation range from the personality, and keep one accent at higher saturation for the primary action. `§19.5`

**How.** Take the chosen hue and reduce saturation by 20–40% for the base; reserve the full-strength version for the primary action or key data. Build the ramp with `05-color.md` §5.3.

**Fails as.** Every color at `hsl(…, 90%, …)`; a muted palette with no accent, so the primary action disappears.

**Audit severity.** P2; P1 when the primary action cannot be found.

---

## 19.6 The palette decision tree

1. **Personality** (`17.1`) → sets the saturation range and temperature.
2. **Dominant hue** (`19.3`) → what the product must communicate.
3. **Harmony scheme** (`19.2`) → how much variety the surface needs.
4. **Saturation** (`19.5`) → match the quadrant.
5. **Ramps** (`05-color.md`) → build 8–10 shades per hue with `scripts/generate_palette.py`.
6. **Contrast** (`05-color.md` §5.6) → verify every foreground/background pair with `scripts/check_contrast.py`.
7. **Semantic aliases** (`15-beyond-the-book.md`) → `action`, `danger`, `surface`, `text-muted`; components never name a hue.

**Rule.** Move through the tree in order; each step constrains the next. `§19.6`

**Fails as.** Starting with "let's use #6366f1" and retrofitting a rationale; generating ramps before choosing the hue; components referencing `indigo-600` directly.

---

## 19.7 Color-direction audit checklist

1. Does the page temperature match the personality? `19.1`
2. Do the non-neutral hues come from one harmony scheme? `19.2`
3. Is the dominant hue justified by the domain and brand? `19.3`
4. Does the palette survive the target cultures? `19.4`
5. Is saturation set deliberately, with one accent? `19.5`
6. Was the palette built in the documented order? `19.6`
7. Does any component name a raw hue instead of a semantic token? `19.6`

## Cross-references

- Ramp construction, HSL, greys, contrast → `05-color.md`
- Semantic token layer and dark mode → `15-beyond-the-book.md`
- Brand personality and domain anchors → `17-brand-personality.md`
- AI-generated palette tells → `14-antipatterns.md` Part 1
