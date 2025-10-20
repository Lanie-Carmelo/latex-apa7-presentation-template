# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Added `.vscode/settings.json` with project-level cSpell configuration (synced from student paper template)

## [1.0.3] - 2025-10-20

### Added
- Added `.cspell.json` configuration file for Code Spell Checker with LaTeX-specific regex patterns to ignore LaTeX commands, comments, inline math, and braced content
- Added clarification in README.md and PRESENTATION-README.md about how screen readers announce en dashes and em dashes (as "en dash"/"em dash", not as semantic interpretations like "through")
- Explained that en dash usage is for APA 7 compliance and typography, not accessibility enhancement

### Changed
- Extended LTeX dictionary with technical terms: CTAN, Tantau, biblatex-apa, Kime
- Suppressed false positive LTeX warnings for CHANGELOG.md word repetitions

## [1.0.2] - 2025-10-20

### Fixed
- Updated version numbers in `CITATION.cff` and `presentation.tex` to match v1.0.2 (were incorrectly showing 1.0.0)

### Changed
- Reorganized README.md Makefile targets table into three sections: Presentation, Paper, and Utility targets for better clarity
- Added manual build instructions for presentations alongside paper instructions
- Replaced hyphens with en dashes (–) for all numeric ranges in documentation (APA 7 compliance)

## [1.0.1] - 2025-10-20

### Fixed
- Removed non-functional `\PassOptionsToClass` command from `presentation-handout.tex` that was positioned after document class declaration
- Removed unused `check` and `refresh` targets from Makefile `.PHONY` declaration
- Fixed LaTeX comment syntax in `QUICKSTART-PRESENTATION.md` (changed `#` to `%`)
- Corrected line number references in `QUICKSTART-PRESENTATION.md`:
  - Title/metadata: Line 87 → Lines 111–115
  - Content: Lines 97–290 → Lines 118–354
  - Notes configuration: Line 74 → Lines 102–108
- Corrected line number reference in `PRESENTATION-README.md` (Line 77 → Lines 104 and 107)
- Fixed font documentation in `PRESENTATION-README.md` to match actual implementation (Liberation Sans with Latin Modern Sans fallback, not Arial)

## [1.0.0] - 2025-10-20

### Added
- Initial release of accessible Beamer presentation template
- `presentation.tex` main presentation file with:
  - Semantic structure using sections, frames, and itemize
  - Comprehensive presenter notes using `\note{}` command
  - APA-style citations with biblatex/biber integration
  - PDF/UA tagged output for screen reader accessibility
  - Sample slides demonstrating best practices
- `presentation-notes.tex` wrapper for displaying notes below slides
- `presentation-handout.tex` wrapper for 4-slides-per-page handout format
- Makefile targets for presentation builds:
  - `make presentation` for standard slides
  - `make presentation-notes` for slides with notes
  - `make presentation-handout` for handout format
  - `make view-presentation` to open presentation
  - `make submissions-presentation` for timestamped archival
- `PRESENTATION-README.md` comprehensive documentation (30+ pages)
- `QUICKSTART-PRESENTATION.md` quick reference guide
- Accessibility features:
  - Color-independent design (no color-only cues)
  - High contrast default theme
  - Simple navigation without decorative symbols
  - Tagged PDF/UA output for screen readers
  - Semantic markup throughout

### Changed
- Updated Makefile to include presentation build targets alongside paper targets
- Extended paper template (v1.2.0) to support presentation creation
- Bibliography (`references.bib`) now shared between paper and presentation templates

### Notes
- This release builds upon the APA 7 Student Paper Template v1.2.0
- Presentation template maintains same accessibility standards as paper template
- Both templates can coexist in same repository with shared bibliography

[Unreleased]: https://github.com/Lanie-Carmelo/latex-apa7-presentation-template/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/Lanie-Carmelo/latex-apa7-presentation-template/releases/tag/v1.0.0
