all : tables graphs
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' talk

TABLES =

GRAPHS = genhere-graph-sortedness-default.pdf genhere-graph-sortedness-sorted.pdf genhere-graph-sortedness-shuffle.pdf \
	 genhere-graph-reorder-cumulative-nodes.pdf

tables : $(TABLES)

graphs : $(GRAPHS)

genhere-graph-%.tex : graph-%.gnuplot
	gnuplot $<

genhere-graph-%.pdf : graph-%.gnuplot $(DATA)
	gnuplot $<
	sed -i -e '5,20s/^\(\\path.*\)/\% \1/' genhere-graph-$*.tex # epic haxx
	latexmk -pdf genhere-graph-$*
