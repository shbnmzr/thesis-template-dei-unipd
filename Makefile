MAIN=main
OUTPUT="Surname_Name.pdf"
TMPDIR=build/
TEXFLAGS=-output-directory=$(TMPDIR) -interaction=nonstopmode -synctex=1 -shell-escape

all: $(OUTPUT)

$(OUTPUT): 
	mkdir -p $(TMPDIR)
	texlua creationdate.lua
	xelatex $(TEXFLAGS) $(MAIN) && mv $(TMPDIR)/$(MAIN).pdf $(OUTPUT)

clean:
	rm -f *.pdf *.aux *.log *.out *.toc *.bbl *.blg *.synctex.gz *.fdb_latexmk *.fls *.nav *.snm *.vrb *.bcf *.timestamp *.xmpi $(OUTPUT)
	rm -f chapters/*.aux chapters/*.log chapters/*.out chapters/*.toc chapters/*.bbl chapters/*.blg chapters/*.synctex.gz chapters/*.fdb_latexmk chapters/*.fls chapters/*.nav chapters/*.snm chapters/*.vrb
	rm -rf $(TMPDIR)

remake: clean all


