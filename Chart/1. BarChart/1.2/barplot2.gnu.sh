set terminal postscript eps enhanced color
set size 1#1
set output "barplot2.eps"
set logscale y 10
set ylabel "Memory [MB]" font ",27" offset -1
set xtics font ", 27"
set ytics font ", 27"
set style histogram errorbars gap 2 lw 5
set style data histograms
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key top left
set key font ", 25"
set xtics offset 0,-0.2,0
plot "barplot2.txt" using 2:2:2:xtic(1) title "EasyIM" lw 5 lc 16 fill pattern 1, \
            '' using 3:3:3 title "VCS" lw 3 lc 11 fill pattern 2, \
            '' using 4:4:4 title "IMRank" lw 5 lc 12 fill pattern 5, \
            '' using 5:5:5 title "PMC" lw 5 lc 14 fill pattern 4,\
            '' using 6:6:6 title "SGDU" lw 5 lc 15 fill pattern 9,\
            '' using 7:8:9 title "IMM" lw 7 lc 10 fill pattern 7
