# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.0cm
set output "gen-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "glasgow.pal"

set multiplot

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

set object 1 rectangle from 0.18, 9e1 to 0.31, 4e2 lc rgb 'black' front fillstyle empty
set arrow 1 from 0.245, 4e2 to screen 0.35, screen 0.65 front

plot \
    for [i=1:150] "rcc-150-0-1000-1000-100000-decide-" . i . ".mean_nodes" u ($1/1000.0):4 w l lc rgb '#666666' lw 1 notitle, \
    "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 2 lw 3 ti "Total", \
    "" u (NaN):(NaN) w l lc rgb '#666666' lw 1 ti "Decision"

unset label 1
unset label 2
unset label 3
unset label 4
unset object 1
unset arrow 1

set origin 0.17, 0.65
set size 0.36, 0.26
set xlabel ""
set ylabel ""
set format x ""
set xrange [0.18:0.31]
set yrange [9e1:4e2]
set noxtics
set noytics
set nogrid
set border 15
set lmargin 0
set rmargin 0
set bmargin 0
set tmargin 0

set object 1 rectangle from graph 0,0 to graph 1,1 behind fc rgb "white" fillstyle solid

plot \
    for [i=1:150] "rcc-150-0-1000-1000-100000-decide-" . i . ".mean_nodes" u ($1/1000.0):4 w l lc rgb '#666666' lw 1 notitle, \
    "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 2 lw 3 ti "Total", \
    "" u (NaN):(NaN) w l lc rgb '#666666' lw 1 ti "Decision"

