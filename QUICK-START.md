# Quick Start Guide

Get up and running with the Novel Framework in 5 minutes.

## Step 1: Fork or Clone

```bash
git clone <repository-url>
cd novel
```

## Step 2: Reset for Your Novel

```bash
./framework/scripts/setup-new-novel.sh
```

Type `yes` when prompted. This will:
- Archive the example novel
- Create fresh template files
- Set up your directory structure

## Step 3: Add Writing Samples (CRITICAL)

Add at least 4 samples of YOUR writing to `writing-samples/`:

```bash
# Create your first sample
nano writing-samples/sample-1.md
# Paste 500+ words of your prose, save and exit

# Repeat for 3 more samples
```

**Why?** These teach Claude your voice. Without them, you'll get generic AI writing.

## Step 4: Configure Your Novel

Edit these three files:

```bash
# Novel basics (title, genre, premise)
nano notes/PROJECT.md

# Story structure
nano notes/plot/outline.md

# Your style preferences
nano notes/style-guide.md
```

## Step 5: Start Writing

```bash
opencode
```

In OpenCode, prompt Claude:

```
Write the opening scene. [Brief description of what happens]
```

Claude will:
- Review your outline and notes
- Study your writing samples
- Write in your voice
- Update metadata automatically
- Organize files properly

## That's It!

You're writing. Claude handles:
- ✅ Consistency tracking
- ✅ Metadata updates
- ✅ File organization
- ✅ Style matching
- ✅ Quality control

You focus on:
- 🎨 Story decisions
- 🎨 Creative direction
- 🎨 What happens next

## Common First Prompts

```
Write the opening scene where [protagonist] [does something].

Continue from the last scene. Show [what happens next].

Write a character introduction scene for [character name].

Draft the inciting incident where [event occurs].
```

## Useful Commands

```bash
# Word count
./framework/scripts/wordcount.sh

# Check for issues
./framework/scripts/consistency-check.sh

# Export complete manuscript
./framework/scripts/export.sh
```

## Getting Help

- Read `README.md` for full documentation
- Review `CLAUDE.md` to understand what Claude does automatically
- Check `AGENTS.md` for writing principles Claude follows

## Tips for Success

1. **Don't skip writing samples** - They're the most important part
2. **Trust Claude** - It maintains consistency automatically
3. **Commit often** - `git commit` after each chapter or scene
4. **Review notes periodically** - Make sure Claude's updates are accurate
5. **Focus prompts on story** - Not on style or organization

## Next Steps

After your first scene:
- Review what Claude wrote
- Check the updated notes
- Prompt for the next scene
- Build momentum

Happy writing!
