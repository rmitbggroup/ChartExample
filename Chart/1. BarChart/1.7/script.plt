set terminal postscript eps enhanced color "Arial,30"
set output 'D:result.eps'
file1 = 'data.txt' 

set size 1.1,1
set xlabel "{/Symbol t}" offset 0,0.5,0
set ylabel "Time (ms)"

set xtics ("4" 1, "5" 2, "6" 3, "7" 4, "4" 6, "5" 7, "6" 8, "7" 9, "4" 11, "5" 12, "6" 13, "7" 14)
set xtics nomirror

#set label 10 'CMC' at 10,500 rotate by -45 center tc ls 1

ymax = 2000
set yrange [0:ymax] 
set for [i=0:5] ytics (i*400)
set xrange[0:15]

set key top right
set key horizontal maxcolumns 3
set key samplen 0.6 width -.4 

set label 1 'CMC' at 2.5,980 rotate by 45 center
set label 2 'RCI' at 7.5,980 rotate by 45 center
set label 3 'RCC+' at 12.5,980 rotate by 45 center


set boxwidth 0.9
set style data histogram
set style histogram clustered rowstacked gap 1
set style fill solid 1
 

plot file1 using 2 t "IO", file1 using 3 t "ALG", file1 using 4 t "SIM"


