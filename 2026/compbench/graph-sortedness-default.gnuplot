# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 11.5cm,6.5cm preamble '\RequirePackage[tt=false, type1=true]{libertine} \RequirePackage[varqu]{zi4} \RequirePackage[libertine]{newtxmath} \RequirePackage[T1]{fontenc}'
set output "genhere-" . ARG0[:(strlen(ARG0)-strlen(".gnuplot"))] . ".tex"

load "viridiswhite.pal"
set palette negative

set xrange [0:]
set yrange [-1:1]
set cbrange [1e-7:1]
set format cb '$10^{%T}$'
set nomcbtics
set border 0
set logscale cb
set cbtics 10
set grid y front lc -1 ls 101
set xtics nomirror out scale 0.2
set ytics nomirror scale 0
set xlabel "Number of colour classes"
set ylabel "Sortedness"

set title "Default ordering"
plot "data/150-0.9-default.heatmap" u 1:2:3 matrix w image axes x1y2 notitle

# 
# set title "Domains of size two first"
# plot "../data/150-0.9-2df.heatmap" u 1:2:3 matrix w image axes x1y2 notitle
# 
# set title "Shuffled"
# plot "../data/150-0.9-shuffle.heatmap" u 1:2:3 matrix w image axes x1y2 notitle
# 
# set title "Sorted"
# plot "../data/150-0.9-sdf.heatmap" u 1:2:3 matrix w image axes x1y2 notitle

