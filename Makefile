# Simplified Makefile for LaTeX project with Pandoc output

# Variables
MAIN = main
TEXFILE = $(MAIN).tex
BIBFILE = references.bib
OUTPUT_DIR = output
SUBMISSIONS_DIR = submissions

# Create submissions directory
submissions-dir:
	mkdir -p $(SUBMISSIONS_DIR)

# Default target
all: pdf html docx

# PDF target
pdf: | $(OUTPUT_DIR)
	lualatex -output-directory=$(OUTPUT_DIR) $(TEXFILE)
	cp $(BIBFILE) $(OUTPUT_DIR)/ 2>/dev/null || true
	cd $(OUTPUT_DIR) && biber $(MAIN)
	lualatex -output-directory=$(OUTPUT_DIR) $(TEXFILE)
	lualatex -output-directory=$(OUTPUT_DIR) $(TEXFILE)

# PDF target using Pandoc
pdf-pandoc: | $(OUTPUT_DIR)
	pandoc $(TEXFILE) \
		--pdf-engine=lualatex \
		--bibliography=$(BIBFILE) \
		--csl=apa.csl \
		-o $(OUTPUT_DIR)/main-pandoc.pdf

# HTML target using Pandoc (with language metadata for accessibility)
html: $(TEXFILE) $(BIBFILE) | $(OUTPUT_DIR)
	pandoc $(TEXFILE) \
		--from latex \
		--to html \
		--standalone \
		--shift-heading-level-by=1 \
		--citeproc \
		--csl=apa.csl \
		--bibliography=$(BIBFILE) \
		--lua-filter=add-refs-heading.lua \
		--metadata lang=en-US \
		--output $(OUTPUT_DIR)/$(MAIN).html

# DOCX target using Pandoc
docx: $(TEXFILE) $(BIBFILE) | $(OUTPUT_DIR)
	pandoc $(TEXFILE) \
		--output=$(OUTPUT_DIR)/main.docx \
		--bibliography=$(BIBFILE) \
		--csl=apa.csl \
		--citeproc

# Check target to verify PDF integrity
check:
	pdfinfo $(OUTPUT_DIR)/$(MAIN).pdf

# Status target to show last modified time of created files
status:
	@echo "📄 Output file status:"
	@ls -lh $(OUTPUT_DIR)/main.pdf $(OUTPUT_DIR)/main.html $(OUTPUT_DIR)/main.docx 2>/dev/null || echo "No output files found."

# Open PDF with default viewer
view:
	@if [ -f $(OUTPUT_DIR)/$(MAIN).pdf ]; then \
		sh -c 'cmd.exe /c start "" "$$(wslpath -w $(OUTPUT_DIR)/$(MAIN).pdf)"'; \
	else \
		echo "Error: PDF not found. Run 'make pdf' first."; \
	fi

# Lint, build, and view
build: lint pdf view

# Refresh open PDF
refresh:
	sh -c 'cmd.exe /c start "" "$$(wslpath -w $(OUTPUT_DIR)/$(MAIN).pdf)"'

# Watch for changes (requires inotify-tools)
watch:
	while true; do \
		inotifywait -e modify $(TEXFILE) $(BIBFILE); \
		make pdf; \
	done

# Lint target (requires chktex)
lint:
	@chktex -q -n22 -n30 $(TEXFILE) || true
	@if [ -f $(OUTPUT_DIR)/$(MAIN).log ]; then \
		grep -Ei "undefined|citation|reference" $(OUTPUT_DIR)/$(MAIN).log || true; \
	fi

# Submissions target
submissions: pdf | submissions-dir
	cp $(OUTPUT_DIR)/$(MAIN).pdf $(SUBMISSIONS_DIR)/$(MAIN)-$(shell date +%Y%m%d-%H%M).pdf
	@echo "✅ Submission saved to $(SUBMISSIONS_DIR)/$(MAIN)-$(shell date +%Y%m%d-%H%M).pdf"

# Clean target - remove intermediate files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.run.xml *.fls *.fdb_latexmk *.synctex.gz
	rm -rf $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.bbl $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.log \
		   $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.toc $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.run.xml \
		   $(OUTPUT_DIR)/*.fls $(OUTPUT_DIR)/*.fdb_latexmk $(OUTPUT_DIR)/*.synctex.gz

# Distclean target to remove all generated files
distclean: clean
	rm -rf $(OUTPUT_DIR) $(SUBMISSIONS_DIR)

# Ensure output directory exists
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Help target
help:
	@echo "Available targets:"
	@echo "  all          - Build PDF, HTML, and DOCX"
	@echo "  pdf          - Build PDF using LaTeX"
	@echo "  pdf-pandoc   - Build PDF using Pandoc"
	@echo "  html         - Build HTML using Pandoc"
	@echo "  docx         - Build DOCX using Pandoc"
	@echo "  build        - Lint, build PDF, and view"
	@echo "  view         - Open PDF in default viewer"
	@echo "  watch        - Watch for changes and rebuild"
	@echo "  lint         - Run LaTeX linter"
	@echo "  submissions  - Copy PDF to submissions folder with timestamp"
	@echo "  status       - Show output file information"
	@echo "  clean        - Remove intermediate files"
	@echo "  distclean    - Remove all generated files"
	@echo "  help         - Show this help message"

# Phony targets
.PHONY: all pdf pdf-pandoc html docx clean distclean check view refresh lint build submissions submissions-dir status help watch
