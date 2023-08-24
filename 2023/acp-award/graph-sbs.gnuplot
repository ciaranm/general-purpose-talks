# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.5cm
set output "gen-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "glasgow.pal"
load "common.gnuplot"

set xrange [1e2:1e6]
set yrange [1400:2100]
set xlabel "Runtime (ms)"
set ylabel "Sat Instances Solved"
set logscale x
set border 3
set grid ls 101 front
set xtics nomirror
set ytics nomirror
set key off
set format x '$10^{%T}$'
set rmargin 10

plot \
    "sipruntimes.data" u (cumx(norestarts)):(cumsaty(norestarts)) smooth cumulative w l ti 'Backtracking' at end ls 1 lw 3, \
    "sipruntimes.data" u (cumx(timer)):(cumsaty(timer)) smooth cumulative w l ti 'Restarts' at end ls 5 lw 3, \

