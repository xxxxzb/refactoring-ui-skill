#!/usr/bin/env bash
# Score a run folder and write index.html
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="${1:-}"
if [[ -z "$DIR" ]]; then
  echo "usage: eval/run.sh eval/runs/<run-id>" >&2
  exit 2
fi
if [[ "$DIR" != /* ]]; then
  DIR="$ROOT/$DIR"
fi
uv run python "$ROOT/eval/score.py" --dir "$DIR"
uv run python "$ROOT/eval/summarize.py" "$DIR"
echo "summary: $DIR/index.html"
