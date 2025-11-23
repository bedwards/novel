# Novel Framework

A lean, AI-powered novel writing framework inspired by Scrivener but built for the command line, git, and Claude AI in OpenCode.

## What Is This?

This is not a GUI application or web app. It's a **structured methodology and file organization system** for writing novels with Claude AI as your creative partner.

Think of it as:
- Scrivener's organization + Obsidian's markdown + Git's version control + Claude's intelligence
- A framework that turns your terminal into a novel-writing IDE
- A system where Claude maintains consistency, structure, and quality while you focus on creativity

## Philosophy

1. **Markdown files in git** - Future-proof, versionable, tool-agnostic
2. **Separation of concerns** - Manuscript, notes, marketing, and framework stay separate
3. **AI as creative partner** - Claude handles housekeeping, you handle creativity
4. **Process over tools** - The workflow matters more than the software
5. **Quality first** - Based on proven craft principles from master writers

## Quick Start

### 1. Fork This Repository

```bash
git clone <your-fork-url>
cd novel
```

### 2. Run Setup Script

```bash
./framework/scripts/setup-new-novel.sh
```

This archives the example novel and creates fresh template files for your project.

### 3. Add Writing Samples (REQUIRED)

Add at least 4 samples of your writing to `writing-samples/`:

```bash
# Examples:
writing-samples/short-story-excerpt.md
writing-samples/blog-post.md
writing-samples/previous-novel-chapter.md
writing-samples/personal-essay.md
```

**Why?** These teach Claude your unique voice and prevent generic AI writing.

### 4. Configure Your Project

Edit these files:
- `notes/PROJECT.md` - Novel title, genre, premise
- `notes/plot/outline.md` - Story structure
- `notes/style-guide.md` - Your stylistic preferences

### 5. Start Writing with Claude

```bash
opencode
```

Then prompt Claude:
```
Write the opening scene of Chapter 1. Sarah arrives at the abandoned house.
```

Claude will:
- Review your outline and character notes
- Check your writing samples for style
- Write the scene in your voice
- Update metadata and organization automatically
- Structure files appropriately

## Directory Structure

```
novel/
├── manuscript/           # Your novel's prose (TO BE PUBLISHED)
│   ├── acts/            # Act-level notes
│   ├── chapters/        # Chapter files
│   └── scenes/          # Individual scenes
│
├── notes/               # Private metadata (NOT FOR PUBLICATION)
│   ├── characters/      # Character profiles
│   ├── settings/        # Location and world details
│   ├── plot/            # Outline, plot threads, structure
│   ├── themes/          # Thematic notes
│   └── research/        # Research and fact-checking
│
├── marketing/           # Publication materials
│   ├── synopsis/        # Short and long synopsis
│   ├── query-letters/   # Agent query letters
│   └── blurbs/          # Back cover copy, etc.
│
├── framework/           # Framework files (DO NOT EDIT NOVELS HERE)
│   ├── scripts/         # Utility scripts
│   └── templates/       # File templates
│
├── writing-samples/     # Your writing for style reference (gitignored)
│
├── .archive/            # Old versions and deleted content
│
├── CLAUDE.md            # Instructions for Claude AI
├── AGENTS.md            # Novel-writing principles and best practices
└── README.md            # This file
```

## How It Works

### The Author's Role (You)

1. **Provide writing samples** - At least 4 examples of your prose
2. **Set up the story** - Outline, characters, world in `notes/`
3. **Prompt for content** - Ask Claude to write scenes, chapters, dialogue
4. **Make creative decisions** - Approve or revise what Claude writes
5. **Guide the vision** - You're the director; Claude is the assistant

### Claude's Role (AI)

Claude automatically handles:

1. **Style matching** - Writes in YOUR voice using your samples
2. **Consistency** - Reviews outline and notes before writing
3. **Metadata maintenance** - Updates character profiles, plot threads, timeline
4. **Organization** - Structures files, names them appropriately, refactors
5. **Quality control** - Applies craft principles from `AGENTS.md`
6. **Git workflow** - Commits and pushes changes to GitHub after each session
7. **Housekeeping** - Tracks continuity, flags issues, maintains order

**You don't need to ask Claude to do these things.** They happen automatically based on `CLAUDE.md`.

## Working with Claude

### Effective Prompts

**Good prompts** (focus on what happens):
```
Write the confrontation scene between Sarah and Detective Miller.
Sarah discovers the truth about her mother's disappearance.
Continue from the last scene. Show the aftermath of the explosion.
```

**Less effective prompts**:
```
Write in my style... [Claude already does this]
Update the character notes... [Claude already does this]
Make sure it's consistent... [Claude already does this]
```

### What Claude Does Automatically

Without being asked, Claude will:
- Read your outline before writing
- Review character profiles
- Check recent scenes for continuity
- Consult writing samples for style
- Update notes with new details
- Organize and structure files
- Apply craft principles from `AGENTS.md`
- Track unresolved plot threads
- Flag inconsistencies
- Commit and push changes to GitHub

### Trust the Process

You focus on **creativity and story decisions**.
Claude handles **consistency and organization**.

## Key Features

### 1. Automatic Metadata Management

When you write a scene, Claude updates:
- Character profiles with new details
- Plot outline with progress
- Setting notes with new locations
- Timeline with events
- Research questions that emerge

### 2. Style Matching

Your writing samples teach Claude:
- Sentence rhythm and structure
- Vocabulary level
- Descriptive density
- Dialogue style
- POV preferences

### 3. Craft Principles Built-In

Claude follows best practices from:
- Anne Lamott (*Bird by Bird*)
- Stephen King (*On Writing*)
- Dean Koontz
- Other master craftspeople

See `AGENTS.md` for details.

### 4. Automatic Version Control

Claude automatically commits and pushes your work to GitHub after each writing session. Your novel is always:
- Version-controlled with full history
- Backed up to GitHub
- Portable and future-proof
- Accessible from any device

You can also manually commit:
```bash
git add manuscript/
git commit -m "Completed Chapter 3"
git push
```

### 5. Scrivener-Inspired Organization

Like Scrivener, you can:
- Break chapters into scenes
- Reorganize easily (they're just files)
- Keep research and notes separate from manuscript
- Export in different formats
- Track metadata separately

Unlike Scrivener:
- No proprietary file format
- No vendor lock-in
- Works on any platform
- Integrates with any text editor
- Free and open source

## Utility Scripts

### Setup New Novel

```bash
./framework/scripts/setup-new-novel.sh
```

Archives existing content and creates fresh templates.

### Word Count

```bash
./framework/scripts/wordcount.sh
```

Counts words in manuscript, by chapter, total, etc.

### Export

```bash
./framework/scripts/export.sh
```

Compiles manuscript into single markdown file for conversion to other formats.

### Consistency Check

```bash
./framework/scripts/consistency-check.sh
```

Scans for common issues (character name variations, timeline problems, etc.)

## Writing Process

### Typical Workflow

1. **Plan** - Update `notes/plot/outline.md` with what happens next
2. **Prompt** - Ask Claude to write the next scene
3. **Review** - Read what Claude wrote
4. **Revise** - Make changes or ask Claude to revise
5. **Continue** - Move to next scene

### Scene-by-Scene Method

Write each scene as a separate file in `manuscript/scenes/`:

```
scenes/
├── 01-sarah-arrives.md
├── 02-finding-the-letter.md
├── 03-confrontation.md
└── 04-revelation.md
```

Later, organize them into chapters or combine as needed.

### Chapter-by-Chapter Method

Write directly in chapter files:

```
chapters/
├── ch-01.md
├── ch-02.md
└── ch-03.md
```

### Hybrid Method

Some chapters are single files, others link to multiple scenes. Use what works for your process.

## Best Practices

### Do This

- ✅ Provide 4+ writing samples
- ✅ Keep outline updated (Claude helps with this)
- ✅ Review character profiles periodically
- ✅ Commit to git regularly
- ✅ Trust Claude to handle consistency
- ✅ Focus prompts on story events
- ✅ Let scenes breathe; don't rush

### Avoid This

- ❌ Writing without providing samples first
- ❌ Trying to control every detail in prompts
- ❌ Asking Claude to do things it already does automatically
- ❌ Rushing through scenes
- ❌ Ignoring the craft principles in `AGENTS.md`
- ❌ Editing files manually without telling Claude

## Advanced Features

### Multiple POV Characters

Track POV in `notes/style-guide.md` and create character profiles for each POV character. Claude will maintain distinct voices.

### Non-Linear Writing

Write scenes out of order. Claude tracks chronology in outline and can help you organize later.

### Research Integration

Add research notes to `notes/research/`. Claude will reference them when writing relevant scenes.

### Theme Tracking

Document themes in `notes/themes/`. Claude can weave them subtly throughout the narrative.

## Troubleshooting

### Claude's writing sounds generic

**Solution**: Add more writing samples. Minimum 4, but 6-8 is better.

### Continuity errors

**Solution**: Ask Claude to review recent chapters and flag inconsistencies. Update notes to resolve.

### Lost track of plot threads

**Solution**: Review `notes/plot/outline.md`. Ask Claude to update it with current status.

### Characters feel inconsistent

**Solution**: Review character profiles in `notes/characters/`. Make sure personality and motivation are clear.

### Scenes feel rushed

**Solution**: Remind Claude to slow down. Novel pace is deliberate, not rushed.

## Exporting and Publishing

### Convert to Other Formats

Use Pandoc to convert to various formats:

```bash
# Export to Word
pandoc manuscript/compiled.md -o novel.docx

# Export to PDF
pandoc manuscript/compiled.md -o novel.pdf

# Export to EPUB
pandoc manuscript/compiled.md -o novel.epub
```

### Compile Manuscript

```bash
./framework/scripts/export.sh
```

Creates a single markdown file with all chapters in order.

## FAQ

### Is this really as good as Scrivener?

Different, not better or worse. Scrivener has a rich GUI. This has git, AI, and markdown. Choose based on your workflow preferences.

### Do I need to know how to code?

No. You need to:
- Use a terminal (basic commands)
- Edit markdown files
- Use git (or learn the basics)
- Work with Claude in OpenCode

### Can I use a different AI?

The framework works with any AI, but `CLAUDE.md` is optimized for Claude. You'd need to adapt instructions for other models.

### Can I still use my regular text editor?

Yes! Edit files in VSCode, Vim, Obsidian, whatever you prefer. OpenCode runs alongside your editor.

### What if I want to switch to traditional software later?

Everything is markdown. Import into Scrivener, Ulysses, or any tool that supports markdown.

### How do I collaborate with other writers?

Use git branches, pull requests, and merge workflows. Each author can work in their own branch.

## Philosophy and Principles

This framework embodies several key beliefs:

1. **Writers write, tools serve** - The framework stays out of your way
2. **AI augments, doesn't replace** - You're the author; Claude is the assistant
3. **Quality over quantity** - Craft matters more than word count
4. **Process enables creativity** - Good structure frees you to create
5. **Open beats proprietary** - Markdown and git outlast any commercial software

## Credits and Inspiration

### Inspired By

- **Scrivener** - Organization and metadata concepts
- **Obsidian** - Markdown-based, interconnected notes
- **Git** - Version control for writing
- **Anne Lamott** - *Bird by Bird*
- **Stephen King** - *On Writing*
- **Dean Koontz** - Craft and structure insights

### Built With

- Markdown
- Git
- Bash scripts
- Claude AI (via OpenCode)
- Your creativity

## License

MIT License - Fork, modify, share freely.

## Contributing

This is a personal framework, but if you fork and improve it:
- Share your enhancements
- Document your workflow variations
- Help other writers

## Support

This is a free, open-source framework. Support comes from the community.

## Getting Started Now

1. Run `./framework/scripts/setup-new-novel.sh`
2. Add writing samples to `writing-samples/`
3. Edit `notes/PROJECT.md`
4. Open OpenCode: `opencode`
5. Prompt Claude: "Let's start writing. I'll provide the first scene setup..."

**Happy writing!**
