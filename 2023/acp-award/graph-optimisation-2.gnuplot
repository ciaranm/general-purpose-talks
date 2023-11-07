# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.0cm
set output "gen-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "glasgow.pal"

c=0.5
d=1.05
set xrange [0.18:0.31]
f150(x)=c*(d**x)
fit f150(x) "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 via c,d
unset xrange

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

set object 1 rectangle from 0.18, 9e1 to 0.31, 4e2 lc rgb 'black' front fillstyle empty
set arrow 1 from 0.245, 4e2 to screen 0.35, screen 0.65 front

plot \
    "rcc-50-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 4 lw 3 ti "$G(50, x)$", \
    "rcc-100-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 3 lw 3 ti "$G(100, x)$", \
    "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 2 lw 3 ti "$G(150, x)$", \

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
    f150(x) w l ls 0 lw 3 notitle, \
    "rcc-50-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 4 lw 3 ti "$G(50, x)$", \
    "rcc-100-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 3 lw 3 ti "$G(100, x)$", \
    "rcc-150-0-1000-1000-100000.mean_nodes" u ($1/1000.0):4 w l ls 2 lw 3 ti "$G(150, x)$"

