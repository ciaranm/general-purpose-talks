# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.0cm
set output "gen-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "glasgow.pal"

set xrange [0.00:1.0]
set yrange [1:1e7]
set xlabel "Edge probability"
set ylabel "Number of recursive calls"
set logscale y
set border 3
set grid ls 101
set xtics nomirror
set ytics nomirror
set key off
set format y '$10^{%T}$'

plot \
    for [i=20:20] "rcc-150-0-1000-1000-100000-decide-" . i . ".mean_nodes" u ($1/1000.0):4 w l lc rgb '#666666' lw 1 notitle, \
    for [i=5:8] "rcc-150-0-1000-1000-100000-decide-" . i . ".mean_nodes" u ($1/1000.0):4 w l lc rgb '#666666' lw 1 notitle, \
    "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 2 lw 3 ti "Total", \
    "" u (NaN):(NaN) w l lc rgb '#666666' lw 1 ti "Decision"

