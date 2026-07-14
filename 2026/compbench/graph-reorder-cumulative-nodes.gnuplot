# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.5cm preamble '\RequirePackage[tt=false, type1=true]{libertine} \RequirePackage[varqu]{zi4} \RequirePackage[libertine]{newtxmath} \RequirePackage[T1]{fontenc}'
set output "genhere-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "glasgow.pal"

set xrange [0.6:1]
set xlabel "Edge probability"
set yrange [1:]
set ylabel "Number of colourings"
set border 3
set grid ls 101
set xtics nomirror
set ytics nomirror

set key at screen 0.7, 0.95 maxrows 3 width -5

plot \
    "data/clique-g150-default-means.data" u 1:3 w l ls 1 lw 2 title "Default", \
    "data/clique-g150-2df-means.data" u 1:3 w l ls 3 lw 2 title "2DF", \
    "data/clique-g150-sdf-means.data" u 1:3 w l ls 6 lw 2 title "SDF"
