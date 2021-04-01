#cd 'C:\Users\e15444\Dropbox\flickr_tsas\k\'

set terminal postscript enhanced color "Times new roman,30"

set output 'time_k_box.ps'

set size square 1,1

set xlabel 'k' offset 0,1,0

set ylabel 'MRPQ (ms)'

set style fill solid 0.25 border -1

set style boxplot outliers pointtype 7

set style data boxplot

set boxwidth  0.2

set pointsize 0.7

unset key

set key top left

set key horizontal maxcolumns 2

set key samplen 0.6 width -.4

set key font "Times new roman,26" 

set xtics ("1" 1.25, "5" 2.25, "10" 3.25, "20" 4.25, "50" 5.25) offset 0,0.5,0

set xtics nomirror


set logscale y

set yrange [4:2048] 

set ytics nomirror (1,4,16,64,256,1024)

plot 'vldb_k2.txt' u (1.0):1 title "SF-BL" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7, '' u (1.1):3 title " SF-GRP" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7, '' u (2.0):5 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7, '' u (2.1):7 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7, '' u (3.0):9 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7, '' u (3.1):11 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7,  '' u (4.0):13 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7, '' u (4.1):15 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7,  '' u (5.0):17 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7, '' u (5.1):19 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7, 'vldb_k_avg.txt' using 1:3 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb 'red', 'vldb_k_avg.txt' u 2:5 title "" fs pattern 3 with lp lt 1 lw 4 lc rgb 'blue',  'geo_k2.txt' u (1.3):1 title "SF-SEP" fillstyle solid 1.0 lc rgb '#FF8C00' lt 1 pt 7, '' u (2.3):3 title "" fillstyle solid 1.0 lc rgb '#FF8C00' lt 1 pt 7, '' u (3.3):5 title "" fillstyle solid 1.0 lc rgb '#FF8C00' lt 1 pt 7, '' u (4.3):7 title "" fillstyle solid 1.0 lc rgb '#FF8C00' lt 1 pt 7, '' u (5.3):9 title "" fillstyle solid 1.0 lc rgb '#FF8C00' lt 1 pt 7, 'geo_k_avg.txt' using 1:2 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb '#FF8C00', 'wand_k2.txt' u (1.5):1 title "TF-MBW" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (2.5):3 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (3.5):5 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (4.5):7 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (5.5):9 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, 'wand_k_avg.txt' using 1:2 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb 'green', 'baseline_bmw_k2.txt' u (1.2):1 title "TF-BL" fillstyle solid 1.0 lc rgb 'purple' lt 1 pt 7, '' u (2.2):3 title "" fillstyle solid 1.0 lc rgb 'purple' lt 1 pt 7,'' u (3.2):5 title "" fillstyle solid 1.0 lc rgb 'purple' lt 1 pt 7,'' u (4.2):7 title "" fillstyle solid 1.0 lc rgb 'purple' lt 1 pt 7,'' u (5.2):9 title "" fillstyle solid 1.0 lc rgb 'purple' lt 1 pt 7,'baseline_bmw_k_avg.txt' using 1:2 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb 'purple'

pause -1


 
 

