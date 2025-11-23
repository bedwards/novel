# Novel Framework - Framework Directory

This directory contains the framework infrastructure: scripts, templates, and documentation that support the novel-writing process.

## Contents

### scripts/
Utility scripts for common operations:

- **setup-new-novel.sh** - Archives existing novel and creates fresh templates
- **wordcount.sh** - Counts words in manuscript by chapter, scene, and total
- **export.sh** - Compiles manuscript into single markdown file
- **consistency-check.sh** - Scans for common writing issues

### templates/
Templates for creating new files:

- **character-template.md** - Template for character profiles
- **setting-template.md** - Template for setting/location notes
- **scene-template.md** - Template for individual scenes

## Important Notes

### Do NOT Edit Novels in This Directory
This directory is for framework infrastructure only. Your novel content belongs in:
- `manuscript/` - The actual novel prose
- `notes/` - Character, setting, plot notes
- `marketing/` - Synopsis, query letters, etc.

### Forking and Customizing
If you fork this framework:
1. Feel free to modify scripts and templates
2. Add your own utility scripts
3. Customize templates for your workflow
4. Share improvements with the community

### Updating the Framework
If you update the framework:
1. Your novel content stays separate
2. Scripts can be updated without affecting your manuscript
3. Consider backing up before major framework changes

## Script Usage

All scripts should be run from the repository root:

```bash
# Setup new novel
./framework/scripts/setup-new-novel.sh

# Check word count
./framework/scripts/wordcount.sh

# Export manuscript
./framework/scripts/export.sh

# Run consistency check
./framework/scripts/consistency-check.sh
```

## Adding Your Own Scripts

Feel free to add custom scripts:

```bash
# Create new script
touch framework/scripts/my-script.sh

# Make executable
chmod +x framework/scripts/my-script.sh

# Add your functionality
```

## Template Customization

Modify templates to match your process:
- Add fields you always use
- Remove sections you don't need
- Adjust structure to your workflow

Templates are just starting points. Use what works for you.
