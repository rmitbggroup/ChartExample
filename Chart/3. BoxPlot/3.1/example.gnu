#cd 'C:\Users\e15444\Dropbox\flickr_tsas\k\'

set terminal postscript enhanced color "Times new roman,30"

set output 'example.ps'

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

plot 'wand_k2.txt' u (1.5):1 title "TF-MBW" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (2.5):3 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (3.5):5 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (4.5):7 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, '' u (5.5):9 title "" fillstyle solid 1.0 lc rgb 'green' lt 1 pt 7, 'wand_k_avg.txt' using 1:2 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb 'green'

pause -1


 
 

