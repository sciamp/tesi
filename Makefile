mainfile 	= tesi
mainfile_tex	= $(mainfile).tex
mainfile_pdf	= $(mainfile).pdf
bib		= bibliografia
images_dir	= images
eps_images	= $(wildcard $(images_dir)/*.eps)
pdf_images	= $(patsubst $(images_dir)/%.eps, $(images_dir)/%.pdf, $(eps_images))

.PHONY: clean pdf img pdfbib

img: $(pdf_images)

$(images_dir)/%.pdf: $(images_dir)/%.eps
	@epstopdf $^

pdfbib: pdf bib
	@pdflatex $(mainfile_tex)
	@pdflatex $(mainfile_tex)

bib:
	@bibtex $(mainfile)

pdf: $(mainfile_pdf)

$(mainfile_pdf): img $(mainfile_tex) $(img)
	@pdflatex $(mainfile_tex)

distclean: clean
	@rm -f *.pdf
clean:
	@rm -f *.aux *.log *.out
