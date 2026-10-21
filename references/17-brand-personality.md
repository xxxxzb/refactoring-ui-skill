# Brand Personality

> ⚠️ **Extension.** The book covers personality in chapter 1 (`§1.4`) as a set of concrete choices: font, color, border radius, language. This file expands that into a working framework. The quadrants, domain anchors and layout profiles are **starting points**, not rules with the book's authority. The project's own brand, audience and conventions override them.

> Load for a brand-direction question, a from-scratch build (Workflow B step 1), or the personality lens in Workflow D.

---

## 17.1 Two axes, four quadrants

Every interface has a personality. Choosing it deliberately is the difference between a design that fits and one assembled from defaults.

Plot the product on two axes:

- **Formal ↔ Casual** — how structured and serious, versus relaxed and approachable.
- **Reserved ↔ Expressive** — how restrained and minimal, versus bold and vibrant.

| | Reserved | Expressive |
|---|---|---|
| **Formal** | Banking, legal, enterprise, government | Luxury, fashion, high-end retail |
| **Casual** | Developer tools, documentation, utilities | Gaming, social, children's education |

**Rule.** Name the quadrant in one sentence before choosing any visual value. `§17.1`

**Fails as.** A fintech dashboard with 16px radii and playful illustrations; a children's app in slate grey with 4px radii. The individual choices are defensible and the combination is incoherent.

**Audit severity.** P2 when the personality is generic; P1 when it actively contradicts the domain or the stated brand.

---

## 17.2 Signals that carry personality

Each lever below pushes the design toward a quadrant. Pick values that agree with each other.

| Signal | Formal / reserved | Middle | Casual / expressive |
|---|---|---|---|
| Border radius | 2–4px | 8–12px | 16px+ |
| Typeface | Neutral or serif | Humanist sans | Rounded or geometric sans |
| Saturation | Muted | Moderate | Vivid |
| Whitespace | Generous, premium | Balanced | Tight, energetic |
| Shadows | Subtle, diffused, or none | One elevation set | Strong offsets |
| Imagery | Photography | Icons + photography | Illustration |
| Density | Sparse | Moderate | Dense or playful |

**Rule.** Radius, typeface, saturation, spacing and shadow style must resolve to the same quadrant. `§17.2`

**Why.** Personality is read from the combination. One expressive lever inside an otherwise reserved system reads as an accident, not as personality.

**How.** Choose the quadrant, then take every value from its column. Where the project has tokens, map the column onto them rather than replacing them.

**Tailwind.** Radius `rounded-sm` / `rounded-lg` / `rounded-2xl`; type `font-serif` or a neutral sans / humanist sans / rounded sans; saturation from the ramp built in `05-color.md`.

**Fails as.** A formal banking UI with one `rounded-full` primary button and a gradient hero; a playful app with every corner at 4px. Both read as "one component came from somewhere else."

**Audit severity.** P1 — inconsistency is visible across components.

---

## 17.3 Domain anchors

Starting points, not templates. The specific product and audience always win.

| Domain | Quadrant | Palette | Radius | Type | Density | Layout signature |
|---|---|---|---|---|---|---|
| Fintech / banking | Formal + reserved | Muted blues, greens; color for data only | 4–6px | Neutral sans | Dense | Persistent sidebar; stat row over table or chart |
| Healthcare | Formal + reserved | Calming blue/green/teal | 6–8px | Humanist sans | Moderate | Centered column ~720px; generous form spacing |
| E-commerce (mass) | Casual + expressive | Bright accent on neutral | 8–12px | Geometric sans | Moderate | Product grid + filters; sticky cart; image-led cards |
| E-commerce (luxury) | Formal + expressive | Muted, near-monochrome | 0–4px | Serif headings | Sparse | Full-bleed imagery; dramatic whitespace |
| Creative tools | Casual + expressive | Bold accent on neutral | 8–16px | Geometric or rounded | Moderate | Asymmetric canvas; personality in empty states |
| Education (K-12) | Casual + expressive | Warm, saturated | 12–16px | Rounded sans | Sparse–moderate | Large touch targets; illustration-led |
| SaaS dashboard | Casual + reserved | Neutral + functional color | 6–8px | Neutral sans | Dense | Sidebar; cards and tables; UI recedes |
| Media / news | Formal + reserved | Near-monochrome | 0–4px | Serif or classic sans | Moderate | Structured grid; narrow measure; minimal chrome |
| Developer tools | Casual + reserved | Dark-first, one accent | 4–8px | Sans + monospace accents | Dense | Sidebar or command surface; high information density |

**Rule.** A domain anchor may seed the first draft; the audience and the brand decide the final values. `§17.3`

**Fails as.** Copying a competitor's palette and calling it a brand; applying "fintech = blue" to a product whose audience is teenagers.

**Audit severity.** P1 when the design contradicts a stated brand; P2 when it merely defaults to the category cliché.

---

## 17.4 The audience checklist

Answer these before making visual choices. Write the answers down; they are the brief.

1. **Who is the primary user?** Age, technical literacy, context of use, device.
2. **What should this evoke?** Trust, excitement, calm, urgency, play.
3. **What builds trust here?** Restraint, polish, friendliness, data density, transparency.
4. **What do competitors look like?** And where should this differ without becoming alien?
5. **Which quadrant does that land in?** One sentence.
6. **What must never appear?** The brand's prohibitions are as useful as its preferences.

**Rule.** A design brief names the audience and the intended feeling. `§17.4`

This is a process rule. It produces a missing-brief finding rather than a visual one when skipped.

---

## 17.5 Content first, layout second

Layout follows the content type and the user's job. Choose the pattern after naming the content.

| Primary content | Layout pattern | Notes |
|---|---|---|
| Long-form text | Single column, 45–75ch | Reading is linear; keep chrome out of the way. `§4.3` |
| Data comparison | Table or side-by-side panels | Horizontal scanning; align numbers right. `§8.6` |
| Status monitoring | Dense card grid + indicators | Density is the feature; prioritize scanability. `§3.1.2` |
| Media browsing | Uniform or masonry grid | Let the content be the design; minimal chrome |
| Sequential workflow | Stepper / wizard, one task per screen | Hide global nav where it distracts; show progress |
| Exploration | Asymmetric feed or marketplace | Varied card sizes; visual hooks; pagination or infinite scroll |

**Rule.** Name the content type and the user's task before selecting a layout. `§17.5`

**Why.** Template-first layout is the root of the generic SaaS page: hero, three cards, testimonials, CTA, applied to a product that needed a table.

**Fails as.** A pricing page as three feature cards when the plans differ on twelve attributes; a dashboard as a hero section; a documentation site as a marketing funnel.

**Audit severity.** P1 — the layout is doing the wrong job.

---

## 17.6 The density spectrum

Density is a deliberate choice, not a default. `§3.1.2`

| Level | Body type | Section spacing | Elements per screen | Fits |
|---|---|---|---|---|
| Sparse | 18–24px | 48–96px | Few | Marketing, onboarding, luxury |
| Moderate | 16px | 24–48px | Balanced | Most product UI |
| Dense | 13–14px | 12–24px | Many | Dashboards, admin, terminals, developer tools |

**Rule.** Density matches the user's expertise and task frequency. `§17.6`

**Why.** Experts scanning daily want data; first-time visitors want guidance. The same product can use both on different screens.

**Fails as.** A trading blotter with marketing-page whitespace; an onboarding screen packed like an admin console.

**Audit severity.** P1 when density is accidental; **do not report density as a defect when the project has deliberately chosen it.** Check `§3.1.2` first.

---

## 17.7 Navigation pattern

| Pattern | Use when | Constraint |
|---|---|---|
| Top horizontal nav | Marketing site; fewer than 5 top-level sections | Keep labels short |
| Sidebar | 5+ sections, deep hierarchy, frequent context switching | Collapsible to icons on narrow screens |
| Tabs | Distinct views within one section | 2–5 tabs |
| Bottom bar (mobile) | Mobile-primary app with 3–5 destinations | Thumb-reachable; active state by color + weight |
| Hybrid (top + sidebar) | Documentation, complex SaaS | Section nav up top, page tree at left |

**Rule.** Navigation structure follows the information architecture, not the viewport. `§17.7`

**Fails as.** A hamburger hiding the only three destinations on mobile; a sidebar for a four-page marketing site; tabs used for unrelated content.

**Audit severity.** P1 when a primary destination is hidden or unreachable; P2 when the pattern merely adds friction.

---

## 17.8 Break the single-page trap

Not everything belongs on one screen:

- **Multi-step processes** → wizard; don't render steps the user hasn't reached.
- **Infrequent settings** → dedicated page or panel; keep them out of the main view.
- **Deep detail** → its own page when it has sub-items, related content or actions.
- **Rule of thumb** → past roughly three viewport heights, the page is doing too much.

**Rule.** Split a surface when its content has distinct jobs. `§17.8`

**Audit severity.** P2, unless the overload hides an action the user needs (P1).

---

## 17.9 The same component, different contexts

A card, button, nav or table is not one design. Before styling a component, ask what it is doing **here**. `§17.9`

### Cards

| Context | Emphasis | Padding | Hover | Separation |
|---|---|---|---|---|
| Product (e-commerce) | Image, price | Tight | Quick-add / size | Border or shadow |
| Stat (dashboard) | The number | Compact | None | Background or border |
| Profile (directory) | Avatar, name | Standard | Profile action | Subtle background |
| Settings | Label + control | Standard | None | Stack with dividers |
| Content (blog/news) | Headline, metadata | Generous | Title underline | Whitespace |

### Navigation

| Context | Treatment |
|---|---|
| Marketing | 4–6 links, logo left, CTA right; may be transparent over the hero |
| App | Persistent sidebar, icon + label, clear active state, grouped sections |
| Documentation | Top bar for sections/version; left page tree; right "on this page" |
| Mobile | Bottom bar, 3–5 items, active state by color and weight |

### Buttons

| Context | Treatment |
|---|---|
| Dense data UI | Small, ghost or outline, icon-only with tooltip where safe |
| Marketing | Large, filled primary, generous horizontal padding |
| Form | Height matches inputs; primary at bottom-right; cancel as ghost |
| Destructive | Muted by default; the loud treatment belongs inside the confirmation |

### Tables

| Context | Treatment |
|---|---|
| Financial / numeric | Right-aligned, tabular numerals, alternating rows, fixed header |
| Admin | Bulk-select column, sortable headers, row hover, inline actions |
| Comparison | Highlighted recommended column, sticky header, icons for booleans |

**Rule.** Component styling follows its context, not a single global template. `§17.9`

**Why.** Reusing one card style everywhere is one of the most reliable signs of template-driven UI, and it flattens real differences in what each region is for.

**Fails as.** Marketing cards and dashboard stat cards sharing a `shadow-lg` hover-lift; every button filled; tables centered.

**Audit severity.** P2; P1 when the context mismatch hides an action or misstates hierarchy.

---

## 17.10 The genericness check

Before shipping, ask:

> "If I showed this to a developer, would they guess an AI made it?"

If yes, name the most generic element. It is usually the color scheme, the layout skeleton, or the uniform component treatment. Change that one thing first, using the frameworks above.

**Audit severity.** P2 by itself; pair it with the specific rule it violates rather than reporting taste.

---

## 17.11 Personality audit checklist

1. Is the quadrant named and consistent? `17.1 17.2`
2. Do radius, type, saturation, spacing and shadow agree? `17.2`
3. Does the palette fit the domain and audience, rather than the category default? `17.3 19.3`
4. Does the layout serve the content type? `17.5`
5. Is the density deliberate for this screen's user? `17.6`
6. Does the navigation match the information architecture? `17.7`
7. Are components adapted to their context? `17.9`
8. Would a developer guess an AI made this? What is the most generic element? `17.10`
9. Are brand prohibitions respected? `17.4`

## Cross-references

- Personality decisions from the book → `01-starting-from-scratch.md` §1.4
- Color selection and harmony → `19-color-psychology.md`
- Ramp construction and contrast → `05-color.md`
- Spacing systems → `03-layout-spacing.md`
- Component recipes → `12-component-recipes.md`
- Voice and copy → `18-copy.md`
