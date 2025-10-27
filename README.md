
# Accessible APA 7 Beamer Presentation Template
**Maintained by Lanie Molinar Carmelo**
- 🌐 [Website](https://laniecarmelo.tech)
- 🐘 [Mastodon (Most active)](https://allovertheplace.ca/@RareBird15)
- 💼 [LinkedIn](https://www.linkedin.com/in/laniecarmelo/)
- 🧑‍💻 [GitHub Profile](https://github.com/lanie-carmelo)

Built for blind and sighted students alike, this template provides an accessible LaTeX Beamer framework for creating APA 7-compliant academic presentations with comprehensive screen reader support.
This repository provides a ready-to-use template for creating accessible academic presentations using LaTeX Beamer with APA 7th edition citation style. It emphasizes accessibility through semantic structure and presenter notes. This template uses biblatex with the biber backend (not BibTeX). It includes:
- `presentation.tex`: Main Beamer presentation with semantic structure and presenter notes
- `presentation-notes.tex`: Wrapper for building presentation with notes visible below slides
- `presentation-handout.tex`: Wrapper for building 4-slides-per-page handout format
- `apa.csl`: Citation Style Language file for APA 7th edition (used by Pandoc)
- `Makefile`: Build system for presentations (standard, notes, handout)
- `references.bib`: Bibliography for presentations
- `.gitignore`: Ignores LaTeX build artifacts and editor backups
- `LICENSE`: MIT License

## Why This Exists
This template is for presentations only. For APA 7-compliant papers, use my [APA 7 Student Paper Template](https://github.com/Lanie-Carmelo/APA-7-Student-Paper-Template).

## Who This is For
This template is designed for students, researchers, and accessibility advocates who want to create APA-compliant presentations using LaTeX Beamer—especially those who:
- Use screen readers (NVDA, JAWS, Orca) or Braille displays
- Need accessible presenter notes for nonvisual practice
- Want semantic structure over visual formatting
- Work locally or in Overleaf

## Accessibility Tools Used
This template was built with screen readers like NVDA and JAWS using Microsoft Visual Studio Code.

### Note on Typography and Screen Readers
This template uses en dashes (–) for numeric ranges (e.g., pages 10–15, years 2020–2025) to comply with APA 7th edition style requirements. Important for screen reader users: Screen readers (NVDA, JAWS, VoiceOver) announce en dashes as "en dash" and em dashes (—) as "em dash"—not as semantic words like "through" or meaningful pauses. En dashes are used here for APA compliance and professional typography, not for accessibility benefits.

## Getting Started
1. **Install LaTeX** (TeX Live, MikTeX, etc.), Biber, and optionally Pandoc
2. **Clone this repo** and add your content to `presentation.tex`
3. **Add your references** to `references.bib`
4. **Build your presentation** using the Makefile (see Build Process)

## Build Process
The provided `Makefile` automates compilation of presentations.
**Note:** This template uses `biblatex` with the `biber` backend (not BibTeX).

### Presentation Targets

| Target                   | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `presentation`           | Builds standard presentation slides (no notes visible).                     |
| `presentation-notes`     | Builds presentation with notes visible below each slide (for rehearsal).    |
| `presentation-handout`   | Builds handout version (4 slides per page).                                 |
| `view-presentation`      | Opens the presentation PDF in your default viewer.                          |
| `submissions-presentation` | Copies presentation to `submissions/` folder with timestamp.              |
| `html`                   | Converts the presentation to HTML using Pandoc with APA citation styling.   |
| `docx`                   | Converts the presentation to DOCX using Pandoc.                            |
| `lint`                   | Runs `chktex` and checks `.log` for missing citations or references.        |
| `clean`                  | Removes LaTeX build artifacts and the output directory.                     |
| `distclean`              | Removes all generated files, including outputs and submissions.             |

To use a target, run:
```sh
make <target>
```
Example:
```sh
make presentation
make html
make docx
```
All outputs are placed in the `output/` directory. Archived PDFs are stored in `submissions/`.

### Manual Build Steps
If you are not using the Makefile, compile your presentation with:
```sh
lualatex presentation.tex
biber presentation
lualatex presentation.tex
lualatex presentation.tex
```
**Do not use `bibtex`—this template requires `biber` for bibliography processing.**


## Overleaf Compatibility
This template works with Overleaf:
- Upload all files (`presentation.tex`, `references.bib`, etc.) to your Overleaf project.
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
- Update the document metadata in `presentation.tex` (`\title`, `\author`, etc.).
- Use the `biblatex` options and APA formatting as needed.
- Modify the Makefile to suit your workflow or add new targets.

## Troubleshooting
If you encounter issues:
1. **Check LaTeX Installation**: Ensure you have a working LaTeX installation and all required packages.
2. **Biber Issues**: If citations or bibliography fail, verify that Biber is installed and properly configured.
3. **Linting Errors**: Run `make lint` to catch syntax issues and missing references.
4. **Log Files**: Review `.log` files for warnings or errors.
5. **Overleaf**: Ensure the bibliography tool is set to Biber in project settings.
6. **Ask for Help**: Reach out via LaTeX forums, Stack Exchange, or GitHub Issues.

## Contributing
Contributions and feedback are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License
MIT License.

## Features
- ✅ Semantic accessibility: Structure and presenter notes for screen reader compatibility
- ✅ **APA 7th Edition Formatting**: Manual formatting following official guidelines
- ✅ **Multiple Output Formats**: PDF, HTML, and DOCX via Pandoc
- ✅ **Automated Builds**: Makefile with linting, viewing, and archiving
- ✅ **Biber Backend**: Modern bibliography processing (not BibTeX)
- ✅ **Overleaf Compatible**: Works seamlessly with Overleaf
- ✅ **LuaLaTeX**: Full Unicode and modern font support

## File Structure
```
├── presentation.tex         # Main LaTeX presentation document
├── presentation-notes.tex   # Presentation with notes below slides
├── presentation-handout.tex # Handout version (4 slides per page)
├── references.bib           # Bibliography database
├── apa.csl                  # APA 7 citation style for Pandoc
├── Makefile                 # Build automation
├── add-refs-heading.lua     # Pandoc filter for references heading
├── .gitignore               # Git ignore patterns
├── README.md                # This file
├── CONTRIBUTING.md          # Contribution guidelines
├── CHANGELOG.md             # Version history and release notes
└── LICENSE                  # MIT License
```

## Citation and Attribution
If you use this template for your academic work, consider acknowledging it:

**Option 1: In your presentation's acknowledgments (informal):**
> This presentation was formatted using the APA 7 Beamer Presentation LaTeX Template (v1.4.0) by Lanie Molinar Carmelo, available at https://github.com/Lanie-Carmelo/latex-apa7-presentation-template

**Option 2: In technical documentation or derivative works:**
```bibtex
@misc{carmelo2025apa7presentation,
  author = {Carmelo, Lanie Molinar},
  title = {APA 7 Beamer Presentation LaTeX Template},
  year = {2025},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/Lanie-Carmelo/latex-apa7-presentation-template}},
  note = {Version 1.4.0}
}
```

**Option 3: For derivative templates:**
- Keep the version header in `presentation.tex` intact
- Document your changes in your own CHANGELOG
- Link back to this repository in your README
- Consider contributing improvements back via pull request

### Why Attribution Matters
- Helps other students discover accessible LaTeX tools
- Supports ongoing development and maintenance
- Acknowledges accessibility advocacy in academic publishing
- Enables tracking of template usage and impact
