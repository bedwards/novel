#!/bin/bash

# wordcount.sh
# Counts words in manuscript

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
MANUSCRIPT_DIR="$ROOT_DIR/manuscript"

echo "=================================================="
echo "Manuscript Word Count"
echo "=================================================="
echo ""

# Total word count
TOTAL=$(find "$MANUSCRIPT_DIR" -name "*.md" -type f -exec cat {} \; | wc -w | tr -d ' ')
echo "Total words: $TOTAL"
echo ""

# By chapter
echo "By chapter:"
echo "---"
if [ -d "$MANUSCRIPT_DIR/chapters" ]; then
    for chapter in "$MANUSCRIPT_DIR/chapters"/*.md; do
        if [ -f "$chapter" ]; then
            count=$(wc -w < "$chapter" | tr -d ' ')
            name=$(basename "$chapter" .md)
            printf "  %-20s %10s words\n" "$name" "$count"
        fi
    done
fi
echo ""

# By scene
echo "By scene (first 20):"
echo "---"
if [ -d "$MANUSCRIPT_DIR/scenes" ]; then
    count=0
    for scene in "$MANUSCRIPT_DIR/scenes"/*.md; do
        if [ -f "$scene" ] && [ $count -lt 20 ]; then
            wc=$(wc -w < "$scene" | tr -d ' ')
            name=$(basename "$scene" .md)
            printf "  %-30s %10s words\n" "$name" "$wc"
            count=$((count + 1))
        fi
    done
    
    total_scenes=$(find "$MANUSCRIPT_DIR/scenes" -name "*.md" -type f | wc -l | tr -d ' ')
    if [ $total_scenes -gt 20 ]; then
        echo "  ... and $((total_scenes - 20)) more scenes"
    fi
fi
echo ""

# Progress estimate (assuming 80,000 word novel)
TARGET=80000
PERCENT=$((TOTAL * 100 / TARGET))
echo "Progress (assuming $TARGET word target): $PERCENT%"
echo ""
