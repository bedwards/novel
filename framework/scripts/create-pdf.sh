#!/bin/bash

# create-pdf.sh
# Creates a PDF from the novel manuscript for review

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
MANUSCRIPT_DIR="$ROOT_DIR/manuscript/scenes"
OUTPUT_DIR="$ROOT_DIR/exports"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTPUT_FILE="$OUTPUT_DIR/novel-$TIMESTAMP.pdf"

echo "=================================================="
echo "Creating PDF from Manuscript"
echo "=================================================="
echo ""

# Create exports directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create temporary combined markdown file
TEMP_MD="$OUTPUT_DIR/temp-combined.md"

# Add title page
cat > "$TEMP_MD" << 'EOF'
---
title: "Lamp Oil"
subtitle: "A Novel"
author: "Brian Edwards"
date: 
geometry: margin=1in
fontsize: 12pt
linestretch: 1.5
---

EOF

# Add prologue
if [ -f "$MANUSCRIPT_DIR/00-prologue.md" ]; then
    echo "Adding: Prologue"
    echo -e "\n# Prologue\n" >> "$TEMP_MD"
    # Skip the first two lines (markdown header)
    tail -n +3 "$MANUSCRIPT_DIR/00-prologue.md" >> "$TEMP_MD"
    echo -e "\n" >> "$TEMP_MD"
fi

# Add chapter 1
if [ -f "$MANUSCRIPT_DIR/01-chapter-one.md" ]; then
    echo "Adding: Chapter One"
    echo -e "\n# Chapter One\n" >> "$TEMP_MD"
    # Skip the first two lines (markdown header)
    tail -n +3 "$MANUSCRIPT_DIR/01-chapter-one.md" >> "$TEMP_MD"
    echo -e "\n" >> "$TEMP_MD"
fi

# Convert to PDF using pandoc
echo ""
echo "Converting to PDF..."
pandoc "$TEMP_MD" \
    -o "$OUTPUT_FILE" \
    --pdf-engine=pdflatex \
    -V linkcolor=blue \
    -V geometry:margin=1in \
    -V fontsize=12pt \
    -V linestretch=1.5 \
    2>&1

# Clean up temp file
rm "$TEMP_MD"

if [ -f "$OUTPUT_FILE" ]; then
    WORD_COUNT=$(find "$MANUSCRIPT_DIR" -name "*.md" -type f -exec cat {} \; | wc -w | tr -d ' ')
    echo ""
    echo "✓ PDF created successfully!"
    echo ""
    echo "Location: $OUTPUT_FILE"
    echo "Word count: $WORD_COUNT"
    echo ""
else
    echo ""
    echo "✗ Error creating PDF"
    echo ""
    exit 1
fi
