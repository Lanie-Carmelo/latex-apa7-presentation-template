# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
