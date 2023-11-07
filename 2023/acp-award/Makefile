all : graphs
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' talk

GRAPHS = \
	gen-graph-sbs.pdf \
	gen-graph-dist.pdf \
	gen-graph-optimisation.pdf \
	gen-graph-optimisation-1.pdf \
	gen-graph-optimisation-2.pdf \
	gen-graph-waves.pdf \
	gen-graph-waves-0.pdf \
	gen-graph-waves-1.pdf \
	gen-graph-waves-2.pdf \
	gen-graph-waves-3.pdf \
	gen-graph-phase-transition.pdf


graphs : $(GRAPHS)

gen-graph-%.tex : graph-%.gnuplot
	gnuplot $<

gen-graph-%.pdf : graph-%.gnuplot $(DATA)
	gnuplot $<
	sed -i -e '/SetUnicodeOption/d' gen-graph-$*.tex
	latexmk -pdf -lualatex gen-graph-$*

