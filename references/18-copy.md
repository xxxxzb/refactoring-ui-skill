# Interface Copy

> ⚠️ **Extension.** The book covers language only as a personality signal (`§1.4.4`); it does not teach copywriting. This file does, for the strings an interface actually contains. It is adapted from the MIT-licensed `jaywilburn/refactoring-ui-skill` and expanded with UI-specific patterns.

> Load for any user-facing string: headline, subhead, CTA, label, helper text, error, empty state, confirmation, onboarding, notification, success message.

---

## 18.1 Copy is interface

A user reads the headline before they see the layout, and reads the button before they click it. Copy carries the claim, the action and the state. Treat it as a design material with the same standards as spacing and contrast.

**Rule.** Every user-facing string is written deliberately, in the product's voice, and reviewed before shipping. `§18.1`

**Why.** Visual craft and generic copy produce a page that looks designed and reads like a template. The mismatch is perceptible even when the reader cannot name it.

**How.**
1. Establish the voice in one or two sentences (see `17-brand-personality.md` §17.4).
2. Write the copy as part of the screen, not after the layout is frozen.
3. Read it aloud at the end. Fix what you stumble on.

**Fails as.** A polished dashboard whose empty state says "No data"; a landing page with a beautiful hero and "Unlock your potential" as the only claim.

**Audit severity.** P1 when the string is on a primary surface (headline, primary CTA, error, destructive confirmation); P2 for secondary copy. P0 when ambiguous copy can cause a destructive mistake.

---

## 18.2 The tells

These patterns make readers say "a language model wrote this." They are not grammar errors; they are rhythm and reflex errors.

| # | Tell | What it looks like | Rule |
|---|---|---|---|
| 1 | **Em-dash addiction** | Every other sentence breaks with an em-dash where a comma or period belongs | `§18.2.1` |
| 2 | **Choppy fragments** | Short staccato sentences stacked for punch. Three in a row | `§18.2.2` |
| 3 | **"It's not just X, it's Y"** | Also "More than just X", "Not only X but Y" | `§18.2.3` |
| 4 | **"Whether you're X or Y"** | Two contrived audiences, both supposedly served | `§18.2.4` |
| 5 | **"From X to Y"** | "From startups to enterprises", "From idea to launch" | `§18.2.5` |
| 6 | **Tricolons everywhere** | "Fast, simple, powerful"; three-item lists in every sentence | `§18.2.6` |
| 7 | **Empty intensifiers** | "Truly", "genuinely", "incredibly", "seamlessly", "effortlessly" | `§18.2.7` |
| 8 | **Marketing clichés** | "Game-changer", "revolutionary", "cutting-edge", "best-in-class" | `§18.2.8` |
| 9 | **Hollow openers** | "In today's fast-paced world…", "Imagine a world where…" | `§18.2.9` |
| 10 | **Uniform sentence length** | Three medium sentences in a row; no rhythm | `§18.2.10` |
| 11 | **Gerund-stacked bullets** | Every bullet starts with "Building", "Creating", "Empowering" | `§18.2.11` |
| 12 | **Hollow CTA verbs** | "Unlock", "discover", "transform", "elevate" | `§18.2.12` |

**The pattern behind the pattern:** each tell is a local rhythm choice that feels polished in isolation and repetitive in aggregate. Read the whole surface, not one string.

---

## 18.3 The antidotes

**`§18.3.1` Em-dashes.** Use a comma where a comma works, a period where a period works. Keep an em-dash for a genuine aside. More than one per paragraph is usually one too many.

**`§18.3.2` Choppy fragments.** Let a thought be one flowing sentence when it wants to be. Vary length: a short sentence after a long one creates emphasis; several short ones in a row read as a press release written in a hurry. Read it aloud.

**`§18.3.3` "It's not just X, it's Y".** Say Y. If X needs acknowledging, give it its own sentence with its own thought.

**`§18.3.4` "Whether you're X or Y".** Pick the actual user. If the product serves two audiences, write to one at a time, or split the page.

**`§18.3.5` "From X to Y".** Name a specific example. "Teams at Stripe and Notion use this" beats "From small teams to Fortune 500."

**`§18.3.6` Tricolons.** Use two items, or one strong adjective. "Fast and reliable" beats "fast, reliable, and powerful."

**`§18.3.7` Empty intensifiers.** Cut them. "Genuinely useful" → "useful". "Incredibly fast" → "fast", or give a number. If the noun does the job, the intensifier is dead weight.

**`§18.3.8` Marketing clichés.** Describe what the product does. Say what it replaces or what the user can now do.

**`§18.3.9` Hollow openers.** Start with a concrete noun, a specific verb, or a real claim. If the first sentence could open any product in the category, rewrite it.

**`§18.3.10` Uniform rhythm.** Break the pattern. A short sentence after a long one; a long one after several short ones to let the reader settle.

**`§18.3.11` Gerund-stacked bullets.** Vary the openings: an imperative ("Ship faster"), a noun ("A real audit trail"), a full sentence. Bullets are not a parallel-structure exam.

**`§18.3.12` Hollow CTA verbs.** Use the verb that describes the click: "Start your free trial", "See pricing", "Read the docs", "Save changes".

**Rule.** Rewrite the tell, not the meaning. `§18.3`

**Fails as.** A page where every sentence is the same length, every claim has three adjectives, and every button says "Get started."

---

## 18.4 The reference standard

Read a column from a publication you respect: The New York Times, The Atlantic, a writer whose work you know. Notice:

- Sentences vary in length and structure.
- Commas do most of the rhythmic work; em-dashes are rare and load-bearing.
- Specificity beats abstraction: a name, a number, a place, a concrete detail.
- The voice has a point of view; it is not trying to please everyone.
- Adjectives are chosen, not stacked.

Then read your copy. If the gap is obvious, the copy needs another pass.

**Rule.** Judge copy against edited prose, not against other marketing pages. `§18.4`

---

## 18.5 UI copy patterns

### Buttons and links

- **Verb + object**: "Save changes", "Delete project", "Invite teammate".
- Name the outcome, not the mechanism: "Send invoice" beats "Submit".
- A link's text must make sense out of context; never "click here".
- Destructive buttons name the object: "Delete project" beats "Delete".

**Rule.** A control's label states what happens when it is used. `§18.5.1`

### Errors

An error message contains three things:

1. **What happened** — in plain language, without blame.
2. **What to do next** — the recovery action, or where to find it.
3. **The data preserved** — confirm the user does not have to retype it.

Avoid: "Invalid input", "Something went wrong", a code with no explanation, "You entered…" (blame). Keep the field label and the entered value visible.

**Rule.** Every error says what happened and what to do. `§18.5.2`

### Empty states

- Say what will appear here.
- Give one action that creates the first item.
- Hide filters, tabs and table headers that do nothing while empty.
- Distinguish "nothing yet" from "nothing matched" — the second needs a way to clear the search.

**Rule.** An empty state explains the feature and offers the first action. `§18.5.3`

### Confirmations

- Name the object and the consequence: "Delete **Q3 report**? This removes 14 charts and cannot be undone."
- The confirm button repeats the verb: "Delete report".
- "Are you sure?" alone is a P0 when the action is destructive.

**Rule.** A destructive confirmation names the object and the consequence. `§18.5.4`

### Labels and helper text

- Label the field with the user's word, not the database's.
- Put units and formats in the helper text, or in the placeholder as an example.
- Required indicators go after the label.
- Helper text survives focus; placeholder text does not.

**Rule.** Field labels use the user's language and state the expected format. `§18.5.5`

### Success and status

- Confirm what happened, then the next step: "Invoice sent to 3 recipients. View invoice."
- Avoid "Success!" with no object.
- Status words stay consistent across the product: pick "Paused" or "On hold", not both.

**Rule.** A success message names the completed action and the next step. `§18.5.6`

### Onboarding

- One idea per step.
- The button says what the step does.
- Skippable unless the step is required for the product to function.
- The last step ends in the product, not in a tour.

**Rule.** Onboarding teaches one action per step and ends in the real interface. `§18.5.7`

---

## 18.6 Length, language and layout

- **Plan for expansion.** German and Finnish strings run longer than English; CJK often shorter. Do not bake English string lengths into fixed-width buttons or tabs.
- **Sentence case** for labels, buttons and headings; title case reads as a headline style and rarely survives translation.
- **Numbers, dates and currency** are copy: state the format, the timezone and the currency. "3–5 days" beats "a few days".
- **Voice** stays constant across error, empty and success states. A playful product can be playful in an error; a bank should not.

**Rule.** Copy is designed for translation and for the real data it will display. `§18.6`

---

## 18.7 Copy gut-check

Before shipping, ask:

> "If I read this aloud, does it sound like a person talking, or like a language model trying to sound polished?"

If it is the latter, the usual culprits are em-dashes, uniform sentence rhythm, and clichés. Fix those three and the copy usually snaps into something a person would write.

**Rule.** Read every user-facing string aloud before shipping. `§18.7`

---

## 18.8 Copy audit checklist

1. Does the primary headline make a specific claim? `18.2.9 18.3.9`
2. Does each CTA name the action? `18.2.12 18.5.1`
3. Do errors say what happened and what to do? `18.5.2`
4. Does the empty state explain the feature and offer one action? `18.5.3`
5. Does a destructive confirmation name the object and consequence? `18.5.4`
6. Are labels in the user's language, with formats stated? `18.5.5`
7. Is the voice consistent across success, error and empty states? `18.1 18.6`
8. Are em-dashes, tricolons, intensifiers and clichés absent? `18.2`
9. Does sentence length vary? `18.2.10 18.3.10`
10. Does the copy survive translation and real data? `18.6`

## Cross-references

- Voice and personality → `17-brand-personality.md` §17.1–17.4
- Language as a personality signal → `01-starting-from-scratch.md` §1.4.4
- Empty states as a design pattern → `08-finishing-touches.md` §8.4
- Error and form states → `12-component-recipes.md`
- AI-generated UI tells beyond copy → `14-antipatterns.md`
