#set xlabel "Average Demand (*1000)" font ",20" offset 0,-0.3,0
#set xtics (10, 20, 40, 80)
set xtics font ",18" offset 0,-0.3,0

# Don\t show the legend in the chart
set nokey
#set key font ",15" inside vertical top right 

# Manual set the Y-axis range
#set ytics (22000, 23000, 24000,25000)
set yrange [0 to 400000]
# Show human-readable Y-axis. E.g. "100 k" instead of 100000.
set ytics font ",20"
set format y '%.0s %c'

# Thinner, filled bars
set boxwidth 0.4
set style fill solid 1.00 
set border 3
set xtics nomirror
set ytics nomirror

set size 0.8, 1
#set offset 0,0.25,0,0

# Lighter grid lines
set grid ytics lc rgb "#ffffff"

plot "alpha-100-inf-10.dat" using 2:xticlabels(1) with boxes lt rgb "#f89441",\
     "" using 3 with boxes lt rgb "#9400d3" fs pattern 9,\
     "" using 4 with boxes lt rgb "#27ad81",\
	 "" using 0:2:5 with labels font ",18" offset .2,1.8,\
	 "" using 0:2:6 with labels font ",18" offset .2,1.1,\
	 "" using 0:2:7 with labels font ",18" offset .2,0.4

set terminal postscript eps color
set terminal postscript eps size 100,400
set terminal postscript eps fontscale 1.5
set output "alpha-100-inf-10.eps"
replot

quit		