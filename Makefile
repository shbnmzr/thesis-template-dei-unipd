# --- Configuration ---
MAIN = main
OUTPUT = Surname_Name.pdf
COMPILER = xelatex
TMPDIR = build

# --- Targets ---
# .PHONY tells Make these aren't actual files, preventing conflicts
.PHONY: all clean clean-all remake

all: $(OUTPUT)

# Build the PDF using latexmk (handles multiple passes and biber automatically)
$(OUTPUT): $(MAIN).tex
	mkdir -p $(TMPDIR)
	# latexmk completely automates the XeLaTeX -> Biber -> XeLaTeX cycle
	latexmk -xelatex -output-directory=$(TMPDIR) -interaction=nonstopmode -synctex=1 -shell-escape $(MAIN).tex
	cp $(TMPDIR)/$(MAIN).pdf $(OUTPUT)

# Clean temporary files (leaves the final PDF)
clean:
	# Clean the build directory
	rm -rf $(TMPDIR)
	# Clean up any leftover aux files just in case the user compiled manually without Make
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.bcf *.run.xml
	rm -f chapters/*.aux appendices/*.aux frontmatter/*.aux

# Clean everything, including the final PDF
clean-all: clean
	rm -f $(OUTPUT) $(MAIN).pdf

# Completely wipe and rebuild from scratch
remake: clean-all all
