all : graphs
	latexmk -pdf -xelatex talk

GRAPHS =

graphs : $(GRAPHS)

gen-graph-%.tex : graph-%.gnuplot
	gnuplot $<

gen-graph-%.pdf : graph-%.gnuplot $(DATA)
	gnuplot $<
	latexmk -pdf gen-graph-$*

