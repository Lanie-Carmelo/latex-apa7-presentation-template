# Accessible APA 7 Beamer Presentation Template

This directory contains an accessible LaTeX Beamer presentation template designed for academic assignments, with APA-style citations and comprehensive screen reader support.

## Overview

This template extends the [APA 7 Student Paper Template](../README.md) to create accessible academic presentations using Beamer. It prioritizes:

- **Semantic structure** over visual formatting
- **Screen reader compatibility** with tagged PDF output
- **Nonvisual navigation** using presenter notes
- **APA-style citations** with BibTeX/Biber integration
- **Modular design** for reuse across presentations

## Quick Start

### Build the Presentation

```bash
# Basic presentation (no notes)
make presentation

# Presentation with notes shown below slides
make presentation-notes

# Handout version (4 slides per page)
make presentation-handout

# View the presentation
make view-presentation
```

### File Structure

```
presentation.tex          # Main presentation file (edit this)
presentation-notes.tex    # Wrapper for notes version
presentation-handout.tex  # Wrapper for handout version
references.bib            # Shared bibliography file
output/                   # Generated PDFs and build artifacts
```

## Accessibility Features

### 1. Semantic Structure

The template uses Beamer's semantic commands exclusively:

- `\section{}` and `\subsection{}` for logical organization
- `\frametitle{}` and `\framesubtitle{}` for slide titles
- `\begin{itemize}` and `\begin{enumerate}` for lists
- `\begin{block}{Title}...\end{block}` for highlighted content

**Avoid:** Visual-only formatting like `\textbf{}` or `\textcolor{}` without semantic meaning.

### 2. Presenter Notes

Use the `\note{}` command to add accessible presenter notes:

```latex
\begin{frame}{Slide Title}
  Slide content here.
  
  \note{
    Speaking notes for this slide.
    Include timing, key points, and reminders.
    Duration: 2 minutes.
  }
\end{frame}
```

**Benefits:**
- Screen-readable reminders of what to say
- Timing information for practice
- Hidden from audience in default mode
- Visible in notes version for rehearsal

### 3. Tagged PDF

The template includes:

```latex
\DocumentMetadata{
  lang=en-US,
  pdfversion=1.7,
  pdfstandard=ua-1,
  testphase={phase-III}
}
```

This ensures PDF/UA compliance for screen reader navigation.

### 4. Clear Navigation

- **Table of contents:** Automatically generated from sections
- **Page numbers:** Simple footer with frame numbers
- **No visual navigation symbols:** These are not accessible to screen readers

### 5. Color Independence

- Default theme uses high-contrast black text on white background
- No color-only cues (e.g., "the red line" without also saying "the solid line")
- All information conveyed through text or semantic structure

## Build Options

### Standard Presentation

```bash
make presentation
```

Creates `output/presentation.pdf` with:
- No presenter notes visible
- Progressive overlays (using `\pause`)
- Suitable for displaying to an audience

### Presentation with Notes

```bash
make presentation-notes
```

Creates `output/presentation-notes.pdf` with:
- Notes shown below each slide
- Useful for rehearsal and practice
- Can be printed for reference during talk

### Handout Version

```bash
make presentation-handout
```

Creates `output/presentation-handout.pdf` with:
- 4 slides per page in landscape format
- All overlays collapsed (no `\pause` effects)
- Suitable for audience handouts

### Save for Submission

```bash
make submissions-presentation
```

Copies the presentation to `submissions/` with a timestamp:
- `submissions/presentation-20251020-1430.pdf`

## Customization

### Change Theme

Edit `presentation.tex`:

```latex
% Simple, accessible themes:
\usetheme{default}        % Minimal (recommended)
\usetheme{Madrid}         % With section/subsection navigation
\usetheme{Berlin}         % With mini-frame navigation
\usetheme{AnnArbor}       % With outline sidebar
```

**Recommendation:** Stick with `default` or `Madrid` for maximum accessibility.

### Adjust Aspect Ratio

Edit line 24 in `presentation.tex`:

```latex
aspectratio=169,  % 16:9 widescreen (default)
aspectratio=43,   % 4:3 traditional
aspectratio=1610, % 16:10
```

### Change Fonts

The template uses Times New Roman by default (matches APA paper template):

```latex
\setmainfont{Times New Roman}
\setsansfont{Arial}  % Used for slide text
```

For better readability on screen, consider:

```latex
\setsansfont{Calibri}  % Modern sans-serif
\setsansfont{Verdana}  % High legibility
```

### Modify Note Display

To show notes on a second screen (dual-monitor setup):

```latex
% In presentation.tex, change:
\setbeameroption{show notes on second screen=right}
```

Options: `right`, `left`, `top`, `bottom`

## Presentation Structure Guidelines

### Timing (20-minute talk)

- Title slide: 30 seconds
- Outline: 1 minute
- Introduction: 3-4 minutes
- Literature review: 3 minutes
- Methodology: 2-3 minutes
- Findings: 4-5 minutes
- Conclusion: 2 minutes
- Questions: remaining time

**Rule of thumb:** 1-2 minutes per slide maximum.

### Content Guidelines

- **Keep it simple:** 20-40 words per slide (max 80)
- **Use short phrases:** Not complete sentences
- **One idea per slide:** Don't overload
- **Use progressive disclosure:** `\pause` to reveal items one at a time
- **Minimize text:** Speak more than you show

### Slide Structure

```latex
\begin{frame}{Descriptive Title}
  \framesubtitle{Optional Clarifying Subtitle}
  
  \begin{itemize}
    \item First main point
    \pause
    \item Second main point
    \pause
    \item Third main point
  \end{itemize}
  
  \note{
    Explain each point in detail.
    Add examples or anecdotes.
    Mention what's NOT on the slide.
    Duration: 2 minutes.
  }
\end{frame}
```

## APA Style Citations

### In-Text Citations

```latex
% Parenthetical citation
According to recent research \parencite{smith2020}...

% Narrative citation
\textcite{smith2020} found that...

% Multiple sources
Several studies \parencite{smith2020,doe2021} show...
```

### References Slide

The template includes a references frame:

```latex
\begin{frame}[allowframebreaks]{References}
  \printbibliography[heading=none]
\end{frame}
```

`allowframebreaks` automatically splits long bibliographies across slides.

## Accessibility Testing

### Screen Reader Testing

Test with:
- **NVDA** (Windows, free)
- **JAWS** (Windows, commercial)
- **Orca** (Linux, free)

Check:
1. All text is readable in reading mode
2. Headings are properly announced
3. Lists are properly structured
4. Navigation follows logical order

### PDF/UA Validation

Use PAC (PDF Accessibility Checker):

```bash
# Check PDF accessibility
pac3 output/presentation.pdf
```

### Manual Checks

- [ ] All slides have descriptive titles
- [ ] No color-only information
- [ ] Text contrast is sufficient (4.5:1 minimum)
- [ ] No flashing or rapid animations
- [ ] All images have alt text (if applicable)

## Advanced Features

### Columns for Side-by-Side Content

```latex
\begin{frame}{Comparison}
  \begin{columns}[t]
    \begin{column}{0.5\textwidth}
      \textbf{Option A}
      \begin{itemize}
        \item Advantage 1
        \item Advantage 2
      \end{itemize}
    \end{column}
    
    \begin{column}{0.5\textwidth}
      \textbf{Option B}
      \begin{itemize}
        \item Advantage 1
        \item Advantage 2
      \end{itemize}
    \end{column}
  \end{columns}
\end{frame}
```

### Blocks for Emphasis

```latex
\begin{frame}{Key Concept}
  \begin{block}{Important Definition}
    A clear, concise definition goes here.
  \end{block}
  
  \begin{alertblock}{Warning}
    Critical information that needs attention.
  \end{alertblock}
  
  \begin{exampleblock}{Example}
    A concrete example demonstrating the concept.
  \end{exampleblock}
\end{frame}
```

### Backup Slides (Appendix)

```latex
\appendix

\section{Appendix}

\begin{frame}[noframenumbering]{Additional Details}
  Content you might need for questions,
  but don't plan to show during main talk.
\end{frame}
```

`noframenumbering` prevents these from affecting slide count.

## Troubleshooting

### Build Errors

**"Undefined citations"**
- Run `make presentation` again (needs 3 passes)
- Check that `references.bib` is in the root directory

**"Font not found"**
- Install Times New Roman and Arial fonts
- Or change fonts in `presentation.tex`

**"Biber not found"**
- Install biber: `sudo apt-get install biber`

### Notes Not Showing

Check line 77 in `presentation.tex`:

```latex
\setbeameroption{show notes}  % Should be active for notes version
```

Or use the correct Make target:

```bash
make presentation-notes  # Not just 'make presentation'
```

### Handout Has Blank Pages

This is normal - 4 slides per page may leave some empty. Adjust with:

```latex
\pgfpagesuselayout{2 on 1}[letterpaper,portrait]  % 2 per page instead
```

## Makefile Reference

### Presentation Targets

| Command | Output | Description |
|---------|--------|-------------|
| `make presentation` | `output/presentation.pdf` | Standard slides (no notes) |
| `make presentation-notes` | `output/presentation-notes.pdf` | Slides with notes below |
| `make presentation-handout` | `output/presentation-handout.pdf` | 4 slides per page |
| `make view-presentation` | - | Opens presentation in viewer |
| `make submissions-presentation` | `submissions/presentation-*.pdf` | Timestamped copy |

### Paper Targets (from main template)

| Command | Output | Description |
|---------|--------|-------------|
| `make pdf` | `output/main.pdf` | APA paper |
| `make html` | `output/main.html` | HTML version |
| `make docx` | `output/main.docx` | Word document |

### Utility Targets

| Command | Description |
|---------|-------------|
| `make clean` | Remove intermediate files |
| `make distclean` | Remove all generated files |
| `make help` | Show all available commands |

## Best Practices

### Do:

- ✅ Use semantic structure (`\section`, `\frametitle`, etc.)
- ✅ Add detailed presenter notes
- ✅ Keep slides simple and uncluttered
- ✅ Use progressive disclosure with `\pause`
- ✅ Test with screen readers
- ✅ Cite sources using `\textcite` and `\parencite`
- ✅ Include timing estimates in notes
- ✅ Prepare backup slides in appendix

### Don't:

- ❌ Use visual-only formatting without semantic meaning
- ❌ Put too much text on slides (max 80 words)
- ❌ Use color as the only way to convey information
- ❌ Remove navigation structure for "cleaner" slides
- ❌ Use complex animations or transitions
- ❌ Assume everyone can see visual elements
- ❌ Skip the outline or summary slides

## Integration with Paper Template

This presentation template shares:

- **Bibliography:** `references.bib` (same file as paper)
- **Output directory:** `output/` (separate files, no conflicts)
- **Makefile:** Extended with presentation targets
- **Accessibility principles:** Same tagged PDF approach

You can maintain both a paper and presentation in the same repository:

```
latex-apa7-presentation-template/
├── main.tex              # Paper (article class)
├── presentation.tex      # Presentation (beamer class)
├── references.bib        # Shared bibliography
├── Makefile              # Builds both
└── output/
    ├── main.pdf          # Paper output
    └── presentation.pdf  # Presentation output
```

## Further Reading

- **Beamer User Guide:** `texdoc beamer` or [CTAN](https://ctan.org/pkg/beamer)
- **APA Citations with biblatex:** `texdoc biblatex-apa`
- **PDF/UA Standard:** [ISO 14289-1](https://www.iso.org/standard/64599.html)
- **WCAG 2.1:** [W3C Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)

## License

This template is released under the MIT License. See [LICENSE](../LICENSE) for details.

## Acknowledgments

Based on:
- [APA 7 Student Paper Template](../README.md) by Lanie Molinar Carmelo
- [Beamer Class](https://ctan.org/pkg/beamer) by Till Tantau, Joseph Wright, and contributors
- [biblatex-apa](https://ctan.org/pkg/biblatex-apa) by Philip Kime

## Support

For issues or questions:
1. Check this README first
2. Review the [main template documentation](../README.md)
3. Consult the Beamer user guide: `texdoc beamer`
4. Test with `make clean && make presentation`
