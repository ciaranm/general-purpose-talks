# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.0cm
set output "gen-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "glasgow.pal"

set multiplot

set xlabel "Edge probability"
set border 3
set grid ls 101
set xtics nomirror
set ytics nomirror 50
set key off

set xrange [0.00:1.0]
set yrange [1:1e7]
set ylabel "Number of recursive calls"
set logscale y
set border 3
set grid ls 101
set ytics nomirror autofreq
set key off
set format y '$10^{%T}$'

set label 2 center at 0.88, 1e6 '$G(150, x)$'
set label 3 center at 0.86, 2e4 '$G(100, x)$'
set label 4 center at 0.86, 3e2 '$G(50, x)$'

plot \
    "rcc-50-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 4 lw 3 ti "$G(50, x)$", \
    "rcc-100-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 3 lw 3 ti "$G(100, x)$", \
    "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 2 lw 3 ti "$G(150, x)$", \

