# Accessible APA 7 Beamer Presentation Template

**Maintained by Lanie Molinar Carmelo**

- 🌐 [Website](https://laniecarmelo.tech)
- 🐘 [Mastodon (Most active)](https://allovertheplace.ca/@RareBird15)
- 💼 [LinkedIn](https://www.linkedin.com/in/laniecarmelo/)
- 🧑‍💻 [GitHub Profile](https://github.com/lanie-carmelo)

Built for blind and sighted students alike, this template provides an accessible LaTeX Beamer framework for creating APA 7-compliant academic presentations with comprehensive screen reader support.

This repository provides a ready-to-use template for creating accessible academic presentations using LaTeX Beamer with APA 7th edition citation style. It emphasizes accessibility through semantic structure, presenter notes, and PDF/UA compliance. This template uses biblatex with the biber backend (not BibTeX). It includes:

- `presentation.tex`: Main Beamer presentation with semantic structure, presenter notes, and PDF/UA tagging
- `presentation-notes.tex`: Wrapper for building presentation with notes visible below slides
- `presentation-handout.tex`: Wrapper for building 4-slides-per-page handout format
- `apa.csl`: Citation Style Language file for APA 7th edition (used by Pandoc)
- `Makefile`: Build system for presentations (standard, notes, handout) and paper formats
- `references.bib`: Shared bibliography for both presentations and papers
- `.gitignore`: Ignores LaTeX build artifacts and editor backups
- `LICENSE`: MIT License

## Why This Exists

I originally built this as an extension to my [APA 7 Student Paper Template](https://github.com/Lanie-Carmelo/APA-7-Student-Paper-Template) to support accessible presentation creation for my coursework as a blind Computer Science student. This template prioritizes nonvisual navigation through comprehensive presenter notes and semantic structure.

## Who This is For

This template is designed for students, researchers, and accessibility advocates who want to create APA-compliant presentations using LaTeX Beamer—especially those who:
- Use screen readers (NVDA, JAWS, Orca) or Braille displays
- Need accessible presenter notes for nonvisual practice
- Want semantic structure over visual formatting
- Require PDF/UA tagged output for accessibility compliance
- Work locally or in Overleaf

## Accessibility Tools Used

This template was built with screen readers like NVDA and JAWS using Microsoft Visual Studio Code with accessible editing practices.

## Getting Started

1. **Install LaTeX** (TeX Live, MikTeX, etc.), Biber, and optionally Pandoc
2. **Clone this repo** and add your content to `presentation.tex`
3. **Add your references** to `references.bib` (see Using Zotero below)
4. **Build your presentation** using the Makefile (see Build Process)

## Build Process

The provided `Makefile` automates compilation of presentations and papers.
**Note:** This template uses `biblatex` with the `biber` backend (not BibTeX).

### Common Targets

| Target        | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| `pdf`         | Compiles the LaTeX document into a tagged, accessible PDF using LuaLaTeX.   |
| `pdf-pandoc`  | Generates a PDF using Pandoc (alternative method).                          |
| `html`        | Converts the LaTeX document to HTML using Pandoc with APA citation styling. |
| `docx`        | Converts the LaTeX document to DOCX using Pandoc.                           |
| `lint`        | Runs `chktex` and checks `.log` for missing citations or references.        |
| `check`       | Displays metadata and integrity info for the compiled PDF.                  |
| `view`        | Opens the final PDF in your default Windows viewer (e.g., Acrobat).         |
| `refresh`     | Reopens the PDF to simulate a manual refresh.                               |
| `build`       | Runs `lint`, compiles the PDF, and opens it—ideal for final review.         |
| `watch`       | Watches for changes to `.tex` or `.bib` and rebuilds automatically.         |
| `submissions` | Copies the final PDF to a `submissions/` folder with a timestamp.           |
| `status`      | Lists output file sizes and last modified times.                            |
| `clean`       | Removes LaTeX build artifacts and the output directory.                     |
| `distclean`   | Removes all generated files, including outputs and submissions.             |

To use a target, run:

```sh
make <target>
```

Example:

```sh
make build
```

All outputs are placed in the `output/` directory. Archived PDFs are stored in `submissions/`.

### Manual Build Steps

If you are not using the Makefile, compile your document with:

```sh
lualatex main.tex
biber main
lualatex main.tex
lualatex main.tex
```

**Do not use `bibtex`—this template requires `biber` for bibliography processing.**

## Overleaf Compatibility

This template works with Overleaf:

- Upload all files (`main.tex`, `references.bib`, etc.) to your Overleaf project.
- In Overleaf, set the bibliography backend to **biber** (Menu → Settings → Compiler → Biber).
- Overleaf automatically runs the correct sequence (`lualatex → biber → lualatex → lualatex`).
- You can manage your bibliography in `references.bib` as usual.

## Using Zotero for References

You can use Zotero to manage your references and export them to BibLaTeX format:

1. Select your references in Zotero.
2. Right-click and choose **Export Items**.
3. Select **Better BibLaTeX** (preferred) or **BibLaTeX** as the format and save as `references.bib`.
4. Replace or merge with the existing `references.bib` in this repository.

**Note:** Install the [Better BibTeX](https://retorque.re/zotero-better-bibtex/) plugin for improved citation keys and automatic updates.

**Zotero Auto-Sync (Optional):**
- Right-click your collection → Export Collection → Enable "Keep Updated"
- Zotero will automatically update `references.bib` when you add/modify entries

## Customization

- Update the document metadata in `main.tex` (`\title`, `\author`, etc.).
- Use the `biblatex` options and APA formatting as needed.
- Modify the Makefile to suit your workflow or add new targets.

## Troubleshooting

If you encounter issues:

1. **Check LaTeX Installation**: Ensure you have a working LaTeX installation and all required packages.
2. **Biber Issues**: If citations or bibliography fail, verify that Biber is installed and properly configured.
3. **Linting Errors**: Run `make lint` to catch syntax issues and missing references.
4. **Log Files**: Review `.log` files for warnings or errors.
5. **Overleaf**: Ensure the bibliography tool is set to Biber in project settings.
6. **Ask for Help**: Reach out via LaTeX forums, Stack Exchange, or GitHub
   Issues.

## Contributing

Contributions and feedback are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License.

## Features

- ✅ PDF/UA-1 tagging: Ensures screen reader compatibility and semantic structure for accessible academic publishing.
- ✅ **APA 7th Edition Formatting**: Manual formatting following official guidelines
- ✅ **Accessible PDFs**: PDF/UA-1 compliant with proper tagging
- ✅ **Multiple Output Formats**: PDF, HTML, and DOCX via Pandoc
- ✅ **Automated Builds**: Makefile with linting, viewing, and archiving
- ✅ **Biber Backend**: Modern bibliography processing (not BibTeX)
- ✅ **Overleaf Compatible**: Works seamlessly with Overleaf
- ✅ **LuaLaTeX**: Full Unicode and modern font support

## File Structure

```
├── main.tex              # Main LaTeX document
├── references.bib        # Bibliography database
├── apa.csl              # APA 7 citation style for Pandoc
├── Makefile             # Build automation
├── add-refs-heading.lua # Pandoc filter for references heading
├── .gitignore           # Git ignore patterns
├── README.md            # This file
├── CONTRIBUTING.md      # Contribution guidelines
├── CHANGELOG.md         # Version history and release notes
└── LICENSE              # MIT License
```

## Citation and Attribution

If you use this template for your academic work, consider acknowledging it:

**Option 1: In your paper's acknowledgments (informal):**
> This paper was formatted using the APA 7 Student Paper LaTeX Template (v1.2.0) by Lanie Molinar Carmelo, available at https://github.com/Lanie-Carmelo/APA-7-Student-Paper-Template

**Option 2: In technical documentation or derivative works:**
```bibtex
@misc{carmelo2025apa7template,
  author = {Carmelo, Lanie Molinar},
  title = {APA 7 Student Paper LaTeX Template},
  year = {2025},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/Lanie-Carmelo/APA-7-Student-Paper-Template}},
  note = {Version 1.2.0}
}
```

**Option 3: For derivative templates:**
- Keep the version header in `main.tex` intact
- Document your changes in your own CHANGELOG
- Link back to this repository in your README
- Consider contributing improvements back via pull request

### Why Attribution Matters

- Helps other students discover accessible LaTeX tools
- Supports ongoing development and maintenance
- Acknowledges accessibility advocacy in academic publishing
- Enables tracking of template usage and impact
