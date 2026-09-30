#!/usr/bin/env bash
# Install agent-guardrails skills globally.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
DEST_BASE="$HOME/.agents/skills"
SKILLS="reduce-hallucinations increase-consistency"

echo "Installing agent-guardrails..."

for skill in $SKILLS; do
  mkdir -p "$DEST_BASE/$skill"
  cp "$SRC_DIR/$skill/SKILL.md" "$DEST_BASE/$skill/SKILL.md"
  echo "  copied $skill -> $DEST_BASE/$skill/"
done

# Symlinks for Claude Code + Codex (both follow Agent Skills spec via symlinks)
for target in "$HOME/.claude/skills" "$HOME/.codex/skills"; do
  mkdir -p "$target"
  for skill in $SKILLS; do
    if [ ! -e "$target/$skill" ]; then
      ln -s "../../.agents/skills/$skill" "$target/$skill"
      echo "  linked $skill -> $target/"
    else
      echo "  skip $skill in $target (exists)"
    fi
  done
done

HOOK_TITLE="Reduce Hallucinations (mandatory)"
add_hook() {
  local file="$1" text="$2"
  mkdir -p "$(dirname "$file")"
  touch "$file"
  if ! grep -qF "$HOOK_TITLE" "$file" 2>/dev/null && [ -n "$text" ]; then
    printf '\n%s\n' "$text" >> "$file"
    echo "  hooked $file"
  else
    echo "  skip hook $file (present or n/a)"
  fi
}

PI_HOOK='## Reduce Hallucinations (mandatory)

At session start, load skill `reduce-hallucinations` (~/.agents/skills/reduce-hallucinations/SKILL.md) and apply its rules to every response containing factual content.

## Increase Consistency (mandatory)

At session start, load skill `increase-consistency` (~/.agents/skills/increase-consistency/SKILL.md) and apply its rules whenever output shape matters.'

GENERIC_HOOK='## Reduce Hallucinations (mandatory)

At session start, load skill `reduce-hallucinations` and apply its rules to every response containing factual content.

## Increase Consistency (mandatory)

At session start, load skill `increase-consistency` and apply its rules whenever output shape matters.'

add_hook "$HOME/.pi/agent/AGENTS.md" "$PI_HOOK"
add_hook "$HOME/.claude/CLAUDE.md" "$GENERIC_HOOK"
add_hook "$HOME/.codex/AGENTS.md" "$GENERIC_HOOK"

echo ""
echo "Done. Verify with /skill:reduce-hallucinations in your agent."
