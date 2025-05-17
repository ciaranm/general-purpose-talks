all : graphs
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' talk

GRAPHS =

graphs : $(GRAPHS)

gen-graph-%.tex : graph-%.gnuplot
	gnuplot $<

gen-graph-%.pdf : graph-%.gnuplot $(DATA)
	gnuplot $<
	latexmk -pdf gen-graph-$*

