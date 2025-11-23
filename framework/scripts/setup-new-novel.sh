#!/bin/bash

# setup-new-novel.sh
# Resets the repository for a new novel project
# This script archives the existing novel and creates fresh template files

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "=================================================="
echo "Novel Framework - New Project Setup"
echo "=================================================="
echo ""

# Warning
echo "⚠️  WARNING: This will archive all existing manuscript and notes!"
echo ""
read -p "Are you sure you want to continue? (type 'yes' to proceed): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo "Setup cancelled."
    exit 0
fi

echo ""
echo "Creating archive of existing content..."

# Create timestamped archive
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
ARCHIVE_DIR="$ROOT_DIR/.archive/novel-$TIMESTAMP"
mkdir -p "$ARCHIVE_DIR"

# Archive existing content
if [ -d "$ROOT_DIR/manuscript" ]; then
    cp -r "$ROOT_DIR/manuscript" "$ARCHIVE_DIR/" 2>/dev/null || true
fi
if [ -d "$ROOT_DIR/notes" ]; then
    cp -r "$ROOT_DIR/notes" "$ARCHIVE_DIR/" 2>/dev/null || true
fi
if [ -d "$ROOT_DIR/marketing" ]; then
    cp -r "$ROOT_DIR/marketing" "$ARCHIVE_DIR/" 2>/dev/null || true
fi

echo "✓ Archived to: .archive/novel-$TIMESTAMP"

echo ""
echo "Clearing existing content..."

# Clear manuscript
rm -rf "$ROOT_DIR/manuscript"/*
mkdir -p "$ROOT_DIR/manuscript/acts"
mkdir -p "$ROOT_DIR/manuscript/chapters"
mkdir -p "$ROOT_DIR/manuscript/scenes"

# Clear notes (preserve structure)
rm -rf "$ROOT_DIR/notes"/*
mkdir -p "$ROOT_DIR/notes/characters"
mkdir -p "$ROOT_DIR/notes/settings"
mkdir -p "$ROOT_DIR/notes/plot"
mkdir -p "$ROOT_DIR/notes/themes"
mkdir -p "$ROOT_DIR/notes/research"

# Clear marketing
rm -rf "$ROOT_DIR/marketing"/*
mkdir -p "$ROOT_DIR/marketing/synopsis"
mkdir -p "$ROOT_DIR/marketing/query-letters"
mkdir -p "$ROOT_DIR/marketing/blurbs"

echo "✓ Directories cleared and recreated"

echo ""
echo "Creating template files..."

# Create basic template files
cat > "$ROOT_DIR/notes/PROJECT.md" << 'EOF'
# Project Overview

## Novel Information
- **Title**: [Your Novel Title]
- **Genre**: [Genre]
- **Target Word Count**: [e.g., 80,000]
- **POV**: [First/Third Person, Single/Multiple]
- **Tense**: [Past/Present]

## Logline
[One sentence description of your novel]

## Premise
[2-3 paragraph description of the core story]

## Themes
[Major themes you want to explore]

## Target Audience
[Who is this novel for?]

## Comparable Titles
[Books similar to yours - "X meets Y"]

## Status
- Started: [Date]
- Current Phase: [Outlining/Drafting/Revising]
- Current Word Count: 0
EOF

cat > "$ROOT_DIR/notes/plot/outline.md" << 'EOF'
# Story Outline

## Three-Act Structure

### Act 1 - Setup (25%)
**Goal**: Establish normal world, introduce characters, inciting incident

- Opening: 
- Inciting Incident:
- First Plot Point:

### Act 2 - Confrontation (50%)
**Goal**: Rising action, complications, midpoint twist, increasing stakes

- Rising Action:
- Midpoint:
- Pinch Points:
- Crisis/All Is Lost:

### Act 3 - Resolution (25%)
**Goal**: Climax, resolution, denouement

- Climax:
- Falling Action:
- Resolution:

## Major Plot Threads

### Thread 1: [Name]
- Setup:
- Development:
- Resolution:

## Open Questions
[Track unresolved plot elements here]
EOF

cat > "$ROOT_DIR/notes/style-guide.md" << 'EOF'
# Writing Style Guide

## Voice and Tone
[Describe the narrative voice - formal/casual, lyrical/sparse, etc.]

## POV Guidelines
- POV Type: [First/Third, Limited/Omniscient]
- POV Character(s):
- POV Rules:

## Stylistic Preferences

### Sentence Structure
[Preferences for sentence rhythm, length variation, etc.]

### Dialogue Style
[How do characters speak? Dialect? Formality?]

### Description Density
[Sparse and minimal vs. lush and detailed]

### Pacing Preferences
[Fast-paced thriller vs. contemplative literary]

## Words to Avoid
- Marcus (reserved placeholder name)
- Chen (reserved placeholder name)
- [Add your own]

## Vocabulary Register
[Literary/Complex vs. Simple/Accessible]

## Genre Conventions to Follow
[Specific expectations for your genre]

## Genre Conventions to Subvert
[Where you're breaking from tradition]
EOF

cat > "$ROOT_DIR/notes/characters/README.md" << 'EOF'
# Character Notes

Create a separate markdown file for each major character.

## Template

```markdown
# [Character Name]

## Basic Information
- **Full Name**: 
- **Age**: 
- **Role**: [Protagonist/Antagonist/Supporting]
- **First Appearance**: [Chapter/Scene]

## Physical Description
[Key details - avoid grocery lists]

## Background
[Relevant history]

## Personality
[Core traits, how they think]

## Motivation
[What do they want? Why?]

## Internal Conflict
[What war rages inside them?]

## Arc
[How do they change?]

## Voice
[How do they speak? Word choice, rhythm, quirks]

## Relationships
[Connections to other characters]

## Notes
[Anything else relevant]
```
EOF

cat > "$ROOT_DIR/notes/settings/README.md" << 'EOF'
# Setting Notes

Create files for major locations and world details.

## Template

```markdown
# [Location Name]

## Overview
[What is this place?]

## Physical Details
[Layout, appearance, atmosphere]

## Sensory Details
- **Sight**: 
- **Sound**: 
- **Smell**: 
- **Touch**: 
- **Taste**: 

## Significance
[Why does this location matter to the story?]

## Scenes Set Here
[List of scenes/chapters]

## Notes
[Anything else]
```
EOF

cat > "$ROOT_DIR/notes/research/questions.md" << 'EOF'
# Research Questions

Track things that need research or fact-checking.

## Pending Research
- [ ] Question 1
- [ ] Question 2

## Completed Research
- [x] Question - Answer/Notes
EOF

cat > "$ROOT_DIR/marketing/synopsis/short-synopsis.md" << 'EOF'
# Short Synopsis

[1-2 paragraph summary of your novel for query letters]
EOF

cat > "$ROOT_DIR/marketing/synopsis/long-synopsis.md" << 'EOF'
# Long Synopsis

[Detailed chapter-by-chapter or comprehensive plot summary including ending]
EOF

cat > "$ROOT_DIR/marketing/query-letters/query-template.md" << 'EOF'
# Query Letter Template

Dear [Agent Name],

[Personalization paragraph - why this agent?]

[Paragraph 1: Hook and premise]

[Paragraph 2: Main character and stakes]

[Paragraph 3: Complications and why we care]

[Paragraph 4: Bio and credits]

Thank you for your consideration.

Sincerely,
[Your Name]
EOF

cat > "$ROOT_DIR/manuscript/README.md" << 'EOF'
# Manuscript

This directory contains your novel's prose.

## Structure

- **acts/**: High-level act notes and summaries
- **chapters/**: Individual chapters (may link to scenes)
- **scenes/**: Individual scene files

## Working Method

You can organize your manuscript in whatever way works for you:

1. **Scene-based**: Write scenes in `scenes/` and link them in `chapters/`
2. **Chapter-based**: Write directly in `chapters/` files
3. **Hybrid**: Some chapters are single files, others are collections of scenes

## File Naming

Use consistent, descriptive names:
- `01-opening.md`
- `02-inciting-incident.md`
- `ch-01.md`
- `act-1.md`

## Current Status

Total word count: 0
Chapters completed: 0
EOF

echo "✓ Template files created"

echo ""
echo "Creating writing samples directory..."

mkdir -p "$ROOT_DIR/writing-samples"
cat > "$ROOT_DIR/writing-samples/README.md" << 'EOF'
# Writing Samples

**REQUIRED**: Add at least 4 writing samples to this directory.

## Purpose

These samples teach Claude your natural writing voice and style. They are:
- For STYLE reference only (not content)
- Kept private (this directory is gitignored)
- Reviewed by Claude before each writing session

## What to Include

Add 4+ samples of your writing:
- Excerpts from previous work
- Blog posts or essays
- Journal entries
- Any prose that represents your voice

## Format

- Name files descriptively: `short-story-excerpt.md`, `blog-post-2023.md`
- Use markdown format
- 500+ words per sample recommended
- Diverse examples help (dialogue, description, different moods)

## Why This Matters

Without your writing samples, Claude will write in generic AI style. The samples help Claude match your unique voice, rhythm, and stylistic preferences.
EOF

echo "✓ Writing samples directory created"

echo ""
echo "=================================================="
echo "✅ Setup Complete!"
echo "=================================================="
echo ""
echo "Next steps:"
echo ""
echo "1. Add at least 4 writing samples to: writing-samples/"
echo "   (This is REQUIRED for quality output)"
echo ""
echo "2. Edit notes/PROJECT.md with your novel information"
echo ""
echo "3. Fill out notes/plot/outline.md with your story structure"
echo ""
echo "4. Create character profiles in notes/characters/"
echo ""
echo "5. Edit notes/style-guide.md with your preferences"
echo ""
echo "6. Start writing! Use OpenCode with Claude to begin:"
echo "   Example: 'Write the opening scene of Chapter 1'"
echo ""
echo "Remember: Claude will maintain notes and organization"
echo "automatically. Focus on prompting about the story."
echo ""
