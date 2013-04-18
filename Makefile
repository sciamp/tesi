mainfile 	= tesi
mainfile_tex	= $(mainfile).tex
mainfile_pdf	= $(mainfile).pdf
bib		= bibliografia
images_dir	= images
eps_images	= $(wildcard $(images_dir)/*.eps)
pdf_images	= $(patsubst $(images_dir)/%.eps, $(images_dir)/%.pdf, $(eps_images))
slides		= presentazione
slides_tex	= $(slides).tex
slides_pdf	= $(slides).pdf

.PHONY: clean pdf img pdfbib pdfslides

img: $(pdf_images)

$(images_dir)/%.pdf: $(images_dir)/%.eps
	@epstopdf $^

pdfbib: pdf bib
	@pdflatex $(mainfile_tex)
	@pdflatex $(mainfile_tex)

bib:
	@bibtex $(mainfile)

pdfslides: $(slides_pdf)

$(slides_pdf): img $(slides_tex) $(img)
	@pdflatex $(slides_tex)

pdf: $(mainfile_pdf)

$(mainfile_pdf): img $(mainfile_tex) $(img)
	@pdflatex $(mainfile_tex)

distclean: clean
	@rm -f *.pdf
clean:
	@rm -f *.aux *.log *.out
