set terminal postscript eps enhanced color "Arial,30"
set output 'D:/result.eps'
set encoding utf8

file = 'data.txt'
file11 = 'algo1_1_0.5_1345039200.txt'
file12 = 'algo1_2_0.5_1345039200.txt'
file13 = 'algo1_3_0.5_1345039200.txt'
file14 = 'algo1_4_0.5_1345039200.txt'
file21 = 'algo2_1_0.5_1345039200.txt'
file22 = 'algo2_2_0.5_1345039200.txt'
file23 = 'algo2_3_0.5_1345039200.txt'
file24 = 'algo2_4_0.5_1345039200.txt'

set style data boxplot
set boxwidth  0.2
set pointsize 0.7

unset key
set key top left
set key horizontal maxcolumns 1
set key samplen 0.6 width -.4

set xtics (1, 2, 3, 4)
set xtics nomirror

set logscale y
set format y "10^{%L}"
set yrange [100:100000]
#num = 5
#max = 1000
#set yrange [0:max]
#set for [i=1:num] ytics ((max/num)*i)

set xrange[0.5:4.5]

set xlabel "# of category" offset 0,0.5,0
set ylabel "Execution time (ms)"

plot file11 u (1.0):1 title "TkS*" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7,file21 u (1.0):1 title "EC2M" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7,file12 u (2.0):1 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7,file22 u (2.0):1 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7,file13 u (3.0):1 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7,file23 u (3.0):1 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7,file14 u (4.0):1 title "" fillstyle solid 1.0 lc rgb 'red' lt 1 pt 7,file24 u (4.0):1 title "" fillstyle solid 1.0 lc rgb 'blue' lt 1 pt 7,file using 1:2 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb 'red',file using 1:3 title "" fs pattern 0 with lp lt 1 lw 4 lc rgb 'blue'