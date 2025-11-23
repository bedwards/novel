#!/bin/bash

# consistency-check.sh
# Scans for common consistency issues

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
MANUSCRIPT_DIR="$ROOT_DIR/manuscript"

echo "=================================================="
echo "Consistency Check"
echo "=================================================="
echo ""

# Check for forbidden names
echo "Checking for forbidden placeholder names..."
echo "---"
if grep -r -n "Marcus\|Chen" "$MANUSCRIPT_DIR" 2>/dev/null; then
    echo "⚠️  Found forbidden names (Marcus/Chen) - these are placeholder names"
else
    echo "✓ No forbidden placeholder names found"
fi
echo ""

# Check for common repetitive patterns
echo "Checking for repetitive patterns..."
echo "---"

# Filter words (saw, felt, heard, noticed, seemed)
FILTER_COUNT=$(grep -r -i "\(saw\|felt\|heard\|noticed\|seemed\)" "$MANUSCRIPT_DIR" 2>/dev/null | wc -l | tr -d ' ')
if [ "$FILTER_COUNT" -gt 50 ]; then
    echo "⚠️  High use of filter words ($FILTER_COUNT occurrences)"
    echo "   Consider: 'She saw the door' → 'The door stood open'"
else
    echo "✓ Filter word usage acceptable ($FILTER_COUNT occurrences)"
fi

# Very/really/quite
INTENSIFIER_COUNT=$(grep -r -i "\(very\|really\|quite\|rather\)" "$MANUSCRIPT_DIR" 2>/dev/null | wc -l | tr -d ' ')
if [ "$INTENSIFIER_COUNT" -gt 30 ]; then
    echo "⚠️  High use of weak intensifiers ($INTENSIFIER_COUNT occurrences)"
    echo "   Consider: 'very tired' → 'exhausted'"
else
    echo "✓ Intensifier usage acceptable ($INTENSIFIER_COUNT occurrences)"
fi

# Adverbs ending in -ly
ADVERB_COUNT=$(grep -r -o -E '\w+ly\s' "$MANUSCRIPT_DIR" 2>/dev/null | wc -l | tr -d ' ')
echo "ℹ️  Adverbs (-ly words): $ADVERB_COUNT"
if [ "$ADVERB_COUNT" -gt 200 ]; then
    echo "   Consider reviewing for stronger verb choices"
fi

echo ""

# Check for character name variations
echo "Checking character names..."
echo "---"
echo "Character name variations (check for consistency):"

# Extract capitalized names (simple heuristic)
grep -r -o -h -E '\b[A-Z][a-z]+\b' "$MANUSCRIPT_DIR" 2>/dev/null | \
    sort | uniq -c | sort -rn | head -20

echo ""

# Check for timeline markers
echo "Checking timeline markers..."
echo "---"
if grep -r -i "three weeks\|two days\|hours later\|next day\|morning\|evening" "$MANUSCRIPT_DIR" 2>/dev/null | head -10; then
    echo ""
    echo "ℹ️  Review timeline markers for consistency"
else
    echo "No obvious timeline markers found"
fi
echo ""

# Word count check
TOTAL=$(find "$MANUSCRIPT_DIR" -name "*.md" -type f -exec cat {} \; | wc -w | tr -d ' ')
echo "Current word count: $TOTAL"
echo ""

echo "✓ Consistency check complete"
echo ""
echo "Note: These are automated heuristics. Use judgment."
echo ""
