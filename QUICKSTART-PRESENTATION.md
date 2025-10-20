# Quick Start Guide: Beamer Presentation Template

## What I've Created for You

I've successfully adapted your APA 7 student paper template into an accessible Beamer presentation template with:

### ✅ **Core Files Created**

1. **`presentation.tex`** - Main presentation file with:
   - Semantic structure (sections, frames, itemize)
   - Comprehensive presenter notes with `\note{}` commands
   - APA-style citations using biblatex
   - PDF/UA tagged output for screen readers
   - Sample content demonstrating best practices

2. **`presentation-notes.tex`** - Wrapper to show notes below slides
3. **`presentation-handout.tex`** - Wrapper for 4-slides-per-page handouts
4. **`PRESENTATION-README.md`** - Complete documentation (30+ pages)
5. **Updated `Makefile`** - New build targets for presentations

### ✅ **Accessibility Features**

- **Semantic markup only** - No visual-only formatting
- **Presenter notes** - Screen-readable reminders with `\note{}`
- **Tagged PDF** - PDF/UA standard for screen reader navigation
- **Color-independent** - High contrast, no color-only cues
- **Simple navigation** - Clear structure, page numbers, no decorative symbols

### ✅ **Build Commands**

```bash
# Standard presentation (no notes visible)
make presentation

# With notes shown below each slide (for practice)
make presentation-notes

# Handout version (4 slides per page for audience)
make presentation-handout

# View the presentation
make view-presentation

# Save timestamped copy
make submissions-presentation
```

## How to Use It

### 1. Edit `presentation.tex`

Open the file and customize:
- Line 87: Title, subtitle, author, institution, date
- Lines 97-290: Your actual presentation content
- Replace example content with your own
- Add `\note{}` commands for speaking reminders

### 2. Build and Preview

```bash
make presentation          # Build PDF
make view-presentation     # Open in viewer
```

### 3. Practice with Notes

```bash
make presentation-notes    # Shows notes below slides
# Print this version for rehearsal
```

### 4. Create Handouts

```bash
make presentation-handout  # 4 slides per page for audience
```

## Key Features Demonstrated

### Presenter Notes (Most Important for You!)

Every slide has a `\note{}` command:

```latex
\begin{frame}{Slide Title}
  Slide content...
  
  \note{
    What to say about this slide.
    Timing estimates.
    Reminders of points to emphasize.
    Duration: 2 minutes.
  }
\end{frame}
```

**These notes are:**
- Hidden from audience by default
- Visible in `presentation-notes.pdf`
- Screen-reader accessible
- Perfect for nonvisual practice

### Semantic Structure

The template uses proper LaTeX/Beamer semantics:
- `\section{}` for major topics (shows in outline)
- `\frametitle{}` for slide titles
- `\begin{itemize}` for bullet points
- `\begin{block}{Title}` for emphasis
- `\pause` for progressive disclosure

### APA Citations

Works just like your paper template:

```latex
\textcite{smith2020} found...       % Smith (2020) found...
\parencite{smith2020}               % (Smith, 2020)
\parencite{smith2020,doe2021}       % (Doe, 2021; Smith, 2020)
```

Uses the same `references.bib` file!

## What's Different from Paper Template

| Feature | Paper (`main.tex`) | Presentation (`presentation.tex`) |
|---------|-------------------|-----------------------------------|
| Document class | `article` | `beamer` |
| Structure | Sections, paragraphs | Sections, frames (slides) |
| Length | Long-form text | Short phrases, bullet points |
| Citations | Same (`biblatex-apa`) | Same (`biblatex-apa`) |
| Output | Letter-size pages | Widescreen slides (16:9) |
| Notes | None | Presenter notes with `\note{}` |

## Recommended Workflow

1. **Write outline** - Use `\section{}` and `\subsection{}` first
2. **Fill content** - Add frames with key points (20-40 words/slide)
3. **Add notes** - Write what you'll say in `\note{}` commands
4. **Build and review** - `make presentation-notes` to see both
5. **Practice** - Use notes version for rehearsal
6. **Finalize** - Build final versions:
   - `make presentation` for presenting
   - `make presentation-handout` for audience

## Example Slide Structure

```latex
\section{Introduction}

\begin{frame}{Research Question}
  \begin{block}{Central Question}
    What is the main problem being addressed?
  \end{block}
  
  \pause
  
  \begin{itemize}
    \item Why this question matters
    \item Current gaps in knowledge
    \item Expected contributions
  \end{itemize}
  
  \note{
    Start by clearly stating the research question.
    Explain why it's significant - connect to real-world issues.
    Mention what's new about your approach.
    Allow time for audience to absorb the question.
    Duration: 2 minutes.
  }
\end{frame}
```

## Customization Options

### Change Theme

Edit line 35 in `presentation.tex`:

```latex
\usetheme{default}   % Minimal (current, recommended)
\usetheme{Madrid}    # With navigation
\usetheme{Berlin}    % With outline sidebar
```

### Change Aspect Ratio

Edit line 24:

```latex
aspectratio=169,  % 16:9 widescreen (current)
aspectratio=43,   % 4:3 traditional
```

### Show Notes on Second Screen

Edit line 74 (for dual-monitor setup):

```latex
\setbeameroption{show notes on second screen=right}
```

## Files You Can Ignore

- `presentation-notes.tex` - Just a wrapper (don't edit)
- `presentation-handout.tex` - Just a wrapper (don't edit)
- `output/` - Generated files (cleaned with `make clean`)

## Need Help?

1. **Full documentation:** See `PRESENTATION-README.md` (comprehensive guide)
2. **Beamer manual:** Run `texdoc beamer` in terminal
3. **Current template:** Everything is documented with comments

## Build Status

✅ Successfully tested:
- `make presentation` - Working (109 KB PDF, 16 slides)
- Font handling - Using Liberation Sans/Latin Modern (no Arial needed)
- Bibliography - Biber integration working
- Tagged PDF - PDF/UA compliance active

## Next Steps

1. Open `presentation.tex` in your editor
2. Replace example content with your presentation
3. Add detailed presenter notes
4. Build with `make presentation-notes` to review
5. Practice your presentation using the notes version
6. Build final version with `make presentation`

---

**Remember:** The presentation template shares the same `references.bib` file as your paper template, so you can cite the same sources in both your papers and presentations!
