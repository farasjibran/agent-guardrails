# agent-guardrails

Two global skills for any Agent Skills-compatible CLI agent (pi, Claude Code, Codex, etc). Adapted from [Claude guardrail guides](https://platform.claude.com/docs/en/test-and-evaluate/strengthen-guardrails/reduce-hallucinations).

| Skill | What it does |
|---|---|
| `reduce-hallucinations` | Admit uncertainty, ground in quotes, cite every claim, verify reasoning |
| `increase-consistency` | Lock output format, constrain via examples, chain subtasks, hold character |

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/farasjibran/agent-guardrails/main/install.sh | bash
```

What it does:
1. Copies `skills/*` to `~/.agents/skills/` (portable path pi reads natively)
2. Symlinks into `~/.claude/skills/` and `~/.codex/skills/`
3. Appends auto-load hook to `~/.pi/agent/AGENTS.md`, `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` (skips if already present)

## Manual install

```bash
git clone https://github.com/farasjibran/agent-guardrails.git
./install.sh
```

Or copy a single skill:

```bash
cp -r skills/reduce-hallucinations ~/.agents/skills/
ln -s ../../.agents/skills/reduce-hallucinations ~/.claude/skills/reduce-hallucinations
ln -s ../../.agents/skills/reduce-hallucinations ~/.codex/skills/reduce-hallucinations
```

## Verify

```
/skill:reduce-hallucinations
/skill:increase-consistency
```

## Sources

- https://platform.claude.com/docs/en/test-and-evaluate/strengthen-guardrails/reduce-hallucinations
- https://platform.claude.com/docs/en/test-and-evaluate/strengthen-guardrails/increase-consistency
