set xlabel "Billboard Influence" font ",20" offset 0,-1,0
set xrange [-.5:9.5]
set xtics ("High" 1, "Low" 8)
set xtics font ",20" offset 0,0,0

set ylabel "Influence / Maximal Influence (%)" font ",20" offset .2,0,0
set yr[0:100]
set ytics font ",20" offset 0,0,0
set ytics (0, 20, 40, 60, 80, 100)

set border
set style data histogram
set style histogram cluster gap 1.5
set style fill solid border
set boxwidth 0.9

set key font ",15" inside vertical top right

set size 1

plot 'billboard.dat' using ($2) title "SG" fs solid 1 lc 1 fillstyle pattern 2,\
'' using ($3) title "NYC" fs solid 1 lc 4 fillstyle pattern 3
	
#plot 'billboard.dat' u 1:2 w lp lt 1 lw 12 pt -1 ps 1.5 t "SG",\
#'' u 1:3 w lp lt 4 lw 15 pt -1 ps 1.5 t "NYC"
	
#plot 'billboard.dat' u 1:2 w lp lt 1 lw 12 pt 1 ps 1.5 t "SG",\
#'' u 1:3 w lp lt 4 lw 15 pt 2 ps 1.5 t "NYC"

set terminal postscript eps color
set terminal postscript eps size 600,400
set terminal postscript eps fontscale 1.5
set output "billboard.eps"
replot

quit		