# Project Overview

This repository provides an APA 7-compliant LaTeX template for accessible academic publishing. It is a **small, single-document template project** (not a large codebase) designed for students to write APA 7th edition papers. The project supports multi-format output (PDF, HTML, DOCX) using LuaLaTeX, Biber, and Pandoc with Makefile automation. It prioritizes screen reader compatibility, semantic markup, and reproducible builds.

**Repository Size:** Small (~20 files in root)
**Primary Language:** LaTeX
**Build Tools:** GNU Make, LuaLaTeX, Biber, Pandoc
**Target Output:** PDF (primary), HTML, DOCX (secondary)
**CI/CD:** GitHub Actions
**Pre-commit:** Enabled with chktex linting

# Repository Structure

**Root Directory Files:**
- `main.tex` - Main LaTeX document (the template users edit)
- `references.bib` - BibTeX bibliography file
- `Makefile` - Build automation (THE SOURCE OF TRUTH for all build commands)
- `apa.csl` - Citation Style Language file for Pandoc
- `add-refs-heading.lua` - Pandoc filter for accessible reference headings
- `README.md` - User documentation
- `CONTRIBUTING.md` - Contribution guidelines
- `CHANGELOG.md` - Version history (must be updated for all releases)
- `LICENSE` - MIT License
- `.gitignore` - Ignores LaTeX artifacts (*.aux, *.log, *.bbl, *.bcf, etc.)
- `.pre-commit-config.yaml` - Pre-commit hook configuration
- `.editorconfig` - Editor configuration

**Directories:**
- `output/` - Build artifacts (PDF, HTML, DOCX). Auto-created by Makefile. **Never commit files from this directory.**
- `submissions/` - Timestamped submission copies. Created by `make submissions`.
- `.github/workflows/` - CI/CD pipeline definitions
- `.vscode/` - VS Code settings (optional, not committed)

**Key CI Files:**
- `.github/workflows/build.yml` - Builds PDF, HTML, DOCX on push/PR
- `.github/workflows/release.yml` - Auto-creates releases from version tags

# Build Instructions (CRITICAL - READ CAREFULLY)

## Prerequisites

**Required tools:**
- TeX Live (or MikTeX) with LuaLaTeX
- Biber (bibliography processor - **NOT BibTeX**)
- GNU Make
- Pandoc (for HTML/DOCX output)
- chktex (for linting)

**Important:** This template uses **Biber, not BibTeX**. Using `bibtex` instead of `biber` will cause bibliography compilation to fail.

## Build Commands (Use Makefile)

**ALWAYS use the Makefile.** Do not run LaTeX commands manually unless absolutely necessary.

### Most Common Commands:

```bash
make pdf          # Build PDF (most common)
make html         # Build HTML
make docx         # Build DOCX
make lint         # Run LaTeX linter (chktex)
make build        # Run lint + build PDF + open viewer
make clean        # Remove build artifacts (*.aux, *.log, etc.)
make submissions  # Copy PDF to submissions/ with timestamp
```

### Build Order and Details:

**PDF Build Process (`make pdf`):**
1. Runs `lualatex` (first pass)
2. Copies `references.bib` to `output/`
3. Runs `biber` in `output/` directory
4. Runs `lualatex` (second pass)
5. Runs `lualatex` (third pass for cross-references)

**Output Location:** All outputs go to `output/` directory (auto-created).

**Build Time:** ~5 minutes in CI (first run), ~2-3 minutes with caching.

### Manual Build (If Makefile Unavailable):

```bash
lualatex -output-directory=output main.tex
cp references.bib output/
cd output && biber main
cd ..
lualatex -output-directory=output main.tex
lualatex -output-directory=output main.tex
```

**Critical:** Always run `lualatex` at least 3 times (once for document, once after biber, once for final cross-references).

## Pre-commit Hooks

**Installation:**
```bash
pre-commit install
```

**Hooks Run:**
1. Check for large files (>1MB)
2. Check for merge conflicts
3. Remove trailing whitespace
4. Fix end-of-file
5. Validate YAML syntax
6. Run `chktex` on `.tex` files (warnings suppressed for rules 22, 30)
7. Check for undefined citations in `main.log`

**Note:** Pre-commit hooks may cause issues with VS Code's built-in git UI. Use terminal for commits: `git add . && git commit -m "message"`

## Continuous Integration (GitHub Actions)

**Trigger Events:**
- Push to `main` branch (except for `.md`, `LICENSE`, `.gitignore` changes)
- Pull requests to `main`
- Manual workflow dispatch

**Jobs:**
1. **PDF Build** (required for merge) - ~5 minutes
   - Caches apt packages for speed
   - **Known Issue:** Ubuntu's libpaper1 package has a bug. Workflow includes workaround: `sudo apt-get install --reinstall libpaper1 || true`
   - Installs: texlive-luatex, biber, chktex, Times New Roman font
   - Runs `make lint` (non-blocking)
   - Runs `make pdf`
   - Uploads PDF artifact (30-day retention)

2. **HTML Build** (optional, non-blocking with `continue-on-error: true`)
   - Installs pandoc
   - Runs `make html`
   - Uploads HTML artifact

3. **DOCX Build** (optional, non-blocking with `continue-on-error: true`)
   - Installs pandoc
   - Runs `make docx`
   - Uploads DOCX artifact

**Branch Protection:** Only PDF build is required to pass for merge approval.

**Build Artifacts:** Available in Actions tab for 30 days after run.

## Release Process

**To Create a Release:**
1. Update `CHANGELOG.md` with version details under `## [Unreleased]`
2. Move `[Unreleased]` section content to a new `## [X.Y.Z] - YYYY-MM-DD` section
3. Commit changes to `main`
4. Create and push a tag:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```
5. GitHub Actions automatically creates a release with changelog notes

**Changelog Format:** Follow Keep a Changelog conventions (Added, Changed, Fixed, etc.)

# Validation and Testing

**Before Committing:**
1. Run `make clean` to remove stale build artifacts
2. Run `make lint` to check for LaTeX issues
3. Run `make pdf` to verify PDF builds successfully
4. Check `output/main.pdf` opens and displays correctly
5. Verify no undefined citations in `output/main.log`

**Common Build Errors:**

1. **"undefined citations"** - Run all 3 `lualatex` passes. Biber must complete successfully.
2. **"biber not found"** - Install Biber (separate from TeX Live in some distros).
3. **"Times New Roman not found"** - Install MS core fonts or use different font in `main.tex`.
4. **"libpaper1 configuration error"** (CI only) - Already worked around in `.github/workflows/build.yml`.

# Coding Standards and Conventions

**LaTeX Style:**
- Use semantic markup: `\section`, `\subsection`, `\label`, `\caption`
- Avoid visual-only formatting (e.g., `\textbf{}` without semantic meaning)
- Always provide alt text for images: `\includegraphics` should include description in caption or alt metadata
- Use `\cite{}` for citations, not manual formatting

**Git Workflow:**
- All commits must be signed with SSH (GPG not supported on maintainer's OpenSUSE system)
- Create branches for changes (direct commits to `main` blocked by branch protection)
- All changes require pull request approval
- Update `CHANGELOG.md` for user-facing changes

**Commit Message Format:**
- Use conventional commits: `feat:`, `fix:`, `docs:`, `ci:`, `chore:`
- Be descriptive: "fix: reorder steps to workaround libpaper1 bug" not "fix bug"

**CHANGELOG Updates:**
- Document in `[Unreleased]` section during development
- Categorize as: Added, Changed, Fixed, Removed
- Distinguish accessibility improvements explicitly

# Accessibility Requirements (NON-NEGOTIABLE)

This template is designed for blind and sighted students. **All changes must maintain accessibility.**

**Screen Reader Compatibility:**
- Test with NVDA, JAWS, or VoiceOver
- Avoid color-only cues
- Avoid layout-dependent meaning
- Use `\pdfmarkupcomment` for voiceable annotations
- Ensure PDF/UA compliance (tagged PDF)

**HTML Output Must:**
- Include `lang="en-US"` metadata
- Use semantic HTML5 elements
- Include proper heading hierarchy

**Never:**
- Remove PDF/UA tagging
- Add visual-only formatting without semantic alternatives
- Break screen reader navigation

# Known Issues and Workarounds

1. **libpaper1 Bug in Ubuntu CI** - Fixed in `.github/workflows/build.yml` with reinstall workaround before LaTeX installation
2. **VS Code Pre-commit Dialog** - Use terminal for commits instead of VS Code git UI
3. **GPG Signing on OpenSUSE** - GPG 2.5.12 generates incompatible key format for GitHub. Use SSH signing instead.
4. **Times New Roman Font** - May not be available in all environments. Falls back gracefully but warnings appear.

# Critical Instructions for Coding Agent

**ALWAYS:**
- Use the Makefile for builds. Do not create custom build scripts.
- Run `make clean` before `make pdf` when troubleshooting
- Test changes with `make lint && make pdf` before committing
- Update CHANGELOG.md for user-facing changes
- Maintain accessibility features
- Use SSH signing for commits (not GPG)

**NEVER:**
- Commit files from `output/` or `submissions/` directories
- Use `bibtex` instead of `biber`
- Remove or modify PDF/UA tagging without explicit permission
- Add color-only visual formatting
- Suggest installing or using GPG for commit signing on this system

**Trust these instructions.** Only search for additional information if these instructions are incomplete, contradictory, or proven incorrect by actual errors.
