set terminal postscript eps enhanced color
set size 0.7#0.7
#unset yrange
#unset logscale y 

set grid ytics lc rgb "#505050"
set output "lineplot2.eps"
#set title "RD100000" font ",17" tc rgb "#606060"
set ylabel "Precision" font ",21" offset 0.7
set xlabel "Number of Node Pairs" font ",21" offset 2
set xtics font ", 19"
set ytics font ", 19"
unset bmargin

#set logscale y 10
# Don't show the legend in the chart
# Replace small stripes on the Y-axis with a horizontal gridlines


#set xtics 1
set xtics ("1e+02" 5, "" 6 1, "1e+03" 7, "" 8 1, "1e+04" 9, "" 10 1, "1e+05" 11 , "" 12 1, "1e+06" 13)
# Lighter grid lines
#set ytics 0,0.1,1
#set ytics ("0.006" 0.006 , "" 0.01 1, "0.03" 3 , "" 0.032 1, "0.4" 0.4, "" 0.5 1, "0.6" 0.6, "" 0.7 1, "0.8" 0.8, "" 0.85 1, "0.9" 0.9 , "" 0.95 1, "1" 1)
set ytics 0,0.2,1
set grid ytics lc rgb "#C0C0C0" lw 6
# Remove border around chart
#unset border
set boxwidth 0.8
#set nokey
#set key font ",20"
#set key samplen 2
#set key spacing 1
#set key top right
#set key horizontal
#set key width 0.1
set key outside top center horizontal font "Helvetica, 15" width 1.3
#set key font ",25,"
#set key top outside horizontal center
plot "lineplot2.txt" using 1:2 title "EHNA" w lp lc 30 lw 3 pt 6 ps 2,\
     "" using 1:3 title "HTNE" w lp lc 15 lw 3 pt 2 ps 2,\
     "" using 1:4 title "CTDNE" w lp lc 24 lw 3 pt 4 ps 2,\
     "" using 1:5  title "Node2Vec" w lp lc 17 lw 3 pt 8 ps 2,\
     "" using 1:6  title "LINE" w lp lc 12 lw 3 pt 10 ps 2