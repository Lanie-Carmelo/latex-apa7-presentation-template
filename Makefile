# Simplified Makefile for LaTeX project with Pandoc output


# Variables
PRESENTATION = presentation
PRESFILE = $(PRESENTATION).tex
BIBFILE = references.bib
OUTPUT_DIR = output
SUBMISSIONS_DIR = submissions

# Create submissions directory
submissions-dir:
	mkdir -p $(SUBMISSIONS_DIR)

# Default target
all: presentation html docx

# Presentation target
presentation: | $(OUTPUT_DIR)
	lualatex -output-directory=$(OUTPUT_DIR) $(PRESFILE)
	cp $(BIBFILE) $(OUTPUT_DIR)/ 2>/dev/null || true
	cd $(OUTPUT_DIR) && biber $(PRESENTATION)
	lualatex -output-directory=$(OUTPUT_DIR) $(PRESFILE)
	lualatex -output-directory=$(OUTPUT_DIR) $(PRESFILE)

# HTML target using Pandoc (with language metadata for accessibility)
html: $(PRESFILE) $(BIBFILE) | $(OUTPUT_DIR)
	pandoc $(PRESFILE) \
		--from latex \
		--to html \
		--standalone \
		--shift-heading-level-by=1 \
		--citeproc \
		--csl=apa.csl \
		--bibliography=$(BIBFILE) \
		--lua-filter=add-refs-heading.lua \
		--metadata lang=en-US \
		--output $(OUTPUT_DIR)/$(PRESENTATION).html

# DOCX target using Pandoc
docx: $(PRESFILE) $(BIBFILE) | $(OUTPUT_DIR)
	pandoc $(PRESFILE) \
		--output=$(OUTPUT_DIR)/$(PRESENTATION).docx \
		--bibliography=$(BIBFILE) \
		--csl=apa.csl \
		--citeproc

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
	@echo "  presentation   - Build presentation PDF"
	@echo "  html           - Build HTML version of presentation"
	@echo "  docx           - Build DOCX version of presentation"
	@echo "  clean          - Remove intermediate files"
	@echo "  distclean      - Remove all generated files"
	@echo "  help           - Show this help message"

# Phony targets
.PHONY: all presentation html docx clean distclean help submissions-dir
