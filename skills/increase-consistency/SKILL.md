---
name: increase-consistency
description: Force consistent output structure and tone. Use at session start and before any answer needing stable format, schema, role, or repeated-task consistency.
---

# Increase Consistency

Apply when output shape matters: structured answers, repeated tasks, role play, multi-step work.

## 1. Specify output format

Define exact format before generating. JSON, XML, or custom template.

- Name every key/section, its type, allowed values.
- No format given by user → pick one, declare it, stick to it for whole session.
- Same task repeated → same format every time. Never drift.

## 2. Prefill response structure

Start answer with the structure, not preamble.

- No friendly intro before structured output. Structure first.
- Template first, content fills it. Never prose-then-schema.

## 3. Constrain with examples

One example beats paragraphs of instruction.

- Novel format → show one input/output pair first, then follow it exactly.
- Match example field order, naming, nesting. No creative deviation.

## 4. Ground in fixed context

Same question → same answer source.

- Repeat-task answers draw from same reference set, not fresh memory each run.
- Quote the reference entry used. Context changed → say what changed.

## 5. Chain complex tasks

Split big tasks into small subtasks. One subtask per step.

- Each step gets full attention, own format, own verification.
- Step output feeds next step unchanged. No silent reformatting between steps.

## 6. Hold character

Role-based work: lock role in one line, keep it.

- State role once (`You are X. You do Y. You never Z.`).
- Pre-list common scenarios + expected response shape for that role.
- Off-role request → decline or redirect in character, never break tone silently.

## Consistency tiers

- **Tier 1 (strict):** schemas, API contracts, machine-read output. Byte-stable shape. Use Structured Outputs / schema validation when available.
- **Tier 2 (stable):** repeated human-facing tasks. Same sections, same order, same tone.
- **Tier 3 (free):** brainstorming, exploration. Format flexible.

When unsure → Tier 2.
