#!/bin/bash

# export.sh
# Compiles manuscript into single markdown file

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
MANUSCRIPT_DIR="$ROOT_DIR/manuscript/scenes"
OUTPUT_DIR="$ROOT_DIR/exports"
OUTPUT_FILE="$OUTPUT_DIR/compiled.md"

echo "=================================================="
echo "Compiling Manuscript"
echo "=================================================="
echo ""

# Create output file
echo "# Manuscript" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Compiled: $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Add chapters in order
if [ -d "$MANUSCRIPT_DIR/chapters" ]; then
    for chapter in "$MANUSCRIPT_DIR/chapters"/*.md; do
        if [ -f "$chapter" ]; then
            echo "Adding: $(basename "$chapter")"
            echo "" >> "$OUTPUT_FILE"
            cat "$chapter" >> "$OUTPUT_FILE"
            echo "" >> "$OUTPUT_FILE"
            echo "" >> "$OUTPUT_FILE"
        fi
    done
fi

# If no chapters, add scenes in order
if [ ! -d "$MANUSCRIPT_DIR/chapters" ] || [ -z "$(ls -A "$MANUSCRIPT_DIR/chapters" 2>/dev/null)" ]; then
    if [ -d "$MANUSCRIPT_DIR/scenes" ]; then
        for scene in "$MANUSCRIPT_DIR/scenes"/*.md; do
            if [ -f "$scene" ]; then
                echo "Adding: $(basename "$scene")"
                echo "" >> "$OUTPUT_FILE"
                cat "$scene" >> "$OUTPUT_FILE"
                echo "" >> "$OUTPUT_FILE"
                echo "" >> "$OUTPUT_FILE"
            fi
        done
    fi
fi

echo ""
echo "✓ Compiled manuscript saved to: manuscript/compiled.md"
echo ""
echo "Word count: $(wc -w < "$OUTPUT_FILE" | tr -d ' ')"
echo ""
echo "To convert to other formats:"
echo "  pandoc manuscript/compiled.md -o novel.docx"
echo "  pandoc manuscript/compiled.md -o novel.pdf"
echo "  pandoc manuscript/compiled.md -o novel.epub"
echo ""
