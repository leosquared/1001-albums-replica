#!/bin/bash
set -e

MAX_ITERATIONS=${1:-10}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration - using OpenCode Zen models
# Format: opencode/<model-id>
MODEL="${OPENCODE_MODEL:-opencode/glm-4.7-free}"
AGENT="${OPENCODE_AGENT:-build}"

echo "🚀 Starting Ralph with OpenCode"
echo "📁 Working on PDF to Text Converter"
echo "🤖 Model: $MODEL"
echo "🔧 Agent: $AGENT"
echo ""

for i in $(seq 1 $MAX_ITERATIONS); do
  echo "═══════════════════════════════════"
  echo "═══ Iteration $i of $MAX_ITERATIONS ═══"
  echo "═══════════════════════════════════"
  
  # Pass model and agent via CLI flags
  OUTPUT=$(cat "$SCRIPT_DIR/prompt.md" | opencode run --model "$MODEL" --agent "$AGENT" 2>&1 | tee /dev/stderr) || true
  
  if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
    echo ""
    echo "✅ All stories complete!"
    echo "📊 Final status:"
    cat "$SCRIPT_DIR/prd.json" | jq '.userStories[] | {id, title, passes}'
    exit 0
  fi
  
  echo ""
  echo "💤 Sleeping 2 seconds before next iteration..."
  sleep 2
done

echo ""
echo "⚠️ Max iterations ($MAX_ITERATIONS) reached"
echo "📊 Current status:"
cat "$SCRIPT_DIR/prd.json" | jq '.userStories[] | {id, title, passes}'
exit 1