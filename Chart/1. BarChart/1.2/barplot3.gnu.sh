set terminal postscript eps enhanced color
set size 1#1
set output "barplot3.eps"
#set logscale y 10
#unset logscale
set ylabel "Score" font ",23" offset 1
set xtics font ", 23"
set ytics font ", 22"
set style histogram clustered gap 2
set style data histogram
set style fill solid 0.6 border
#set boxwidth 20 absolute
set offset -0.2,-0.2,0
set xtics format ""
#set ytics 0.4,0.1,1
set yrange [0.4:1]
set ytics 0.4,0.1,1
set grid ytics
set key outside top center horizontal font "Helvetica, 20" width 1.8
#set key font ", 21"
#set key width 5

set xtics offset 0,-0.2,0
plot "barplot3.txt" using 2:xticlabels(1) title "EHNA" lw 5 lc 30 fill pattern 1, \
            '' using 3:xticlabels(1) title "HTNE" lw 3 lc 15 fill pattern 2, \
            '' using 4:xticlabels(1) title "Node2Vec" lw 5 lc 17 fill pattern 5, \
            '' using 5:xticlabels(1) title "LINE" lw 5 lc 12 fill pattern 4,\
            '' using 6:xticlabels(1) title "GraphSAGE" lw 5 lc 10 fill pattern 7

# plot "dblp.txt" using 2:2:4:xtic(1) title "EHNG" lw 5 lc 11 fill pattern 1, \
#             '' using 3:3:4 title "HTNE" lw 3 lc 15 fill pattern 2, \
#             '' using 4:4:4 title "Node2Vec" lw 5 lc 17 fill pattern 5, \
#             '' using 5:5:4 title "Line" lw 5 lc 12 fill pattern 4,\
#             '' using 6:6:4 title "GraphSAGE" lw 5 lc 10 fill pattern 9