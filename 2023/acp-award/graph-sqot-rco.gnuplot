# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.5cm preamble '\RequirePackage[tt=false, type1=true]{libertine} \RequirePackage[varqu]{zi4} \RequirePackage[libertine]{newtxmath} \RequirePackage[T1]{fontenc}'
set output "gen-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "viridis-white.pal"
set palette negative

set title "Anti Heuristic"
set xlabel "Incumbent"
set y2label "Number of calls" rotate by 270 offset character -1.5, character 0
set border 9
set grid ls 101 front noytics y2tics xtics
set xtics nomirror
set noytics
set y2tics nomirror offset character -0.5, character 0
set key off
set format y2 '$10^{%.0f}$'
set nocolorbox
set xrange [9.5:21.5]
set y2range [0:6]
set xtics 0,5,20
set mxtics 5

plot \
    "../cirrus-results/sqot-150-0-650-850-100000-20-rco.heatmap" u 2:($1/10):3 matrix with image axes x1y2 notitle

