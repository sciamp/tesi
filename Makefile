mainfile 	= tesi
mainfile_tex	= $(mainfile).tex
mainfile_pdf	= $(mainfile).pdf
bib		= $(mainfile).bib
images_dir	= images
eps_images	= $(wildcard $(images_dir)/*.eps)
pdf_images	= $(patsubst $(images_dir)/%.eps, $(images_dir)/%.pdf, $(eps_images))

.PHONY: clean pdf img

img: $(pdf_images)

$(images_dir)/%.pdf: $(images_dir)/%.eps
	@epstopdf $^

pdf: $(mainfile_pdf)

$(mainfile_pdf): img $(mainfile_tex) $(img)
	@pdflatex $(mainfile_tex)

distclean: clean
	@rm -f *.pdf
clean:
	@rm -f *.aux *.log *.out
