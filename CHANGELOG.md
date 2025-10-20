# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [1.2.0] - 2025-10-20

### Added
- Version tracking in main.tex header with repository URL and attribution guidelines
- CITATION.cff file for machine-readable citation metadata
- VERSION file for easy version tracking
- Citation and attribution section in README with BibTeX example
- Guidance for derivative works and template attribution
- Pre-commit hooks for automated LaTeX linting and quality checks
- Automatic release workflow triggered by version tags
- CODEOWNERS file to automate code review assignments and clarify ownership of repository files for contributors
- Comprehensive Copilot instructions file for improved coding agent efficiency

### Changed
- Split CI workflow into parallel PDF, HTML, and DOCX jobs
- Made HTML and DOCX builds non-blocking (only PDF is required)
- Improved .gitignore patterns

## [1.1.1] - 2025-10-20

### Fixed
- GitHub Actions CI build font installation
  - Fixed Times New Roman font installation in CI environment
  - Added automatic EULA acceptance for msttcorefonts installer
  - Improved font cache update with verbose logging
  - Added font verification step to catch installation issues

## [1.1.0] - 2025-10-20

### Added
- Support for DOCX output via Pandoc
- Enhanced PDF/UA accessibility compliance checks
- Additional citation examples in `main.tex`
- Improved build scripts for multi-format output
- Expanded documentation for contributors

## [1.0.0] - 2025-10-20

### Added

- Initial public release
- Sample `main.tex` with placeholder metadata, citation examples, and PDF/UA tagging
- Sample `references.bib` with book and journal entries, including DOI and ISBN metadata
- `Makefile` with targets for PDF (LaTeX and Pandoc), HTML, DOCX, linting, viewing, archiving, and submissions
- Lua filter for Pandoc to add accessible reference headings
- APA 7 citation style file (`apa.csl`) for Pandoc
- LuaLaTeX support with Times New Roman font
- Accessibility features (PDF/UA-1 compliance)
- Multiple output formats (PDF, HTML, DOCX)
- MIT License
- CONTRIBUTING.md with contribution guidelines

[Unreleased]: https://github.com/lanie-carmelo/apa-7-student-paper-template/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/lanie-carmelo/apa-7-student-paper-template/compare/v1.1.1...v1.2.0
[1.1.1]: https://github.com/lanie-carmelo/apa-7-student-paper-template/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/lanie-carmelo/apa-7-student-paper-template/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/lanie-carmelo/apa-7-student-paper-template/releases/tag/v1.0.0
