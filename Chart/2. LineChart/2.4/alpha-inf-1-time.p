set xlabel "{/Symbol a}" font ",20" offset 0,-0.3,0
set xtics (40, 60, 80, 100, 120)
set xtics font ",20" offset 0,-0.3,0
set format x "%.0f%%"
#set logscale x 2

set ylabel "Time Cost (Seconds)" font ",20" offset 0,0,0
set yr[0.01:1000]
set format y "10^{%L}"
set ytics (0.01, 0.1, 1, 10, 100, 1000)
set ytics font ",20" rotate offset 0,0,0
set logscale y 10

# Thinner, filled bars
set boxwidth 0.3
set style fill solid 1.00 

# Don\t show the legend in the chart
set nokey
#set key font ",15" inside vertical top right 

set size 1,1
	
	
plot 'alpha-inf-1-time.dat' u 1:2 w lp lt 1 lw 15 pt 1 ps 3 t "Greedy1",\
'' u 1:3 w lp lt 2 lw 15 pt 4 ps 3 t "Greedy2",\
'' u 1:4 w lp lt 3 lw 15 pt 3 ps 3 t "RLS1",\
'' u 1:5 w lp lt 4 lw 15 pt 2 ps 3 t "RLS2",\

set terminal postscript eps color
set terminal postscript eps size 600,400
set terminal postscript eps fontscale 1.5
set output "alpha-inf-1-time.eps"
replot

quit		