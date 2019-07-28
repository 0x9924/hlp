OUTDIR=tmp

crop-pdf-pares-impares:
	pdflatex -output-directory=$(OUTDIR) $@.tex \
	&& mupdf $(OUTDIR)/$@.pdf
