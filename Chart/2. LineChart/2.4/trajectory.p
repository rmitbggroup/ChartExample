set xlabel "Billboard Number (%)" font ",20" offset 0,-1,0
set xrange [0:100]
set xtics (0, 20, 40, 60, 80, 100)
set xtics font ",20" offset 0,0,0

set ylabel "Trajectory Number (%)" font ",20" offset .2,0,0
set yr[0:100]
set ytics font ",20" offset 0,0,0
set ytics (0, 20, 40, 60, 80, 100)

set border
set style data histogram
set style histogram cluster gap 1.5
set style fill solid border
set boxwidth 0.9

set key font ",15" inside vertical bottom right

set size 1
	
	
plot 'trajectory.dat' u 1:2 w lp lt 1 lw 12 pt -1 ps 1.5 t "SG",\
'' u 1:3 w lp lt 4 lw 15 pt -1 ps 1.5 t "NYC"

set terminal postscript eps color
set terminal postscript eps size 600,400
set terminal postscript eps fontscale 1.5
set output "trajectory.eps"
replot

quit		