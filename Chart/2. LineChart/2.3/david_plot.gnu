set terminal postscript enhanced color "Impact,28"
set output 'lineplot.ps'

set size square 1,1
set xlabel 'Dataset size'
set ylabel 'Time(s)'

set pointsize 1
unset key
set key top left font "Impact,20"
set key vertical maxrows 3
set key inside

set xtics ("20K" 0, "40K" 1, "60K" 2, "80K" 3, "100K" 4)
set xtics nomirror
set yrange [0.001:5000] 
set ytics nomirror (0.001,0.01,0.1,1,10,100)
set logscale y
plot 'data.txt' using 1:2 title "t2vec" with lp pointtype 5 lt 1 ps 2.5 lc rgb 'red',\
'data.txt' using 1:3 title "DTW" with lp pointtype 7 lt 1 ps 2.5 lc rgb 'orange',\
'data.txt' using 1:4 title "EDR" with lp pointtype 9 lt 1 ps 2.5 lc rgb 'blue',\
'data.txt' using 1:5 title "ERP" with lp pointtype 11 lt 1 ps 2.5 lc rgb 'forest-green',\
'data.txt' using 1:6 title "LCSS" with lp pointtype 13 lt 1 ps 2.5 lc rgb 'dark-magenta',\
'data.txt' using 1:7 title "Our model" with lp pointtype 15 lt 1 ps 2.5 lc rgb 'black'