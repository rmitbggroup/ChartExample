#设置画图格式为柱状图
set style data histogram 

set style histogram clustered gap 1

#set style fill pattern 3 border -1
set style fill solid border -1

#设置xy轴名称
set xlabel "Inital Infected Passenger (%)" 
set ylabel "Final Infected Passenger (%)" offset 1.5,-1.5

#设置图形最终的缩放比例
set size 0.66,0.8 

#图标位置
set nokey
#set key left 

# Thinner, filled bars
#set boxwidth 0.1

#x轴标示倾斜的角度
set xtics rotate by -45

set size 0.8,0.8

#设置x2（及最上边轴）的范围
#set x2range [103:104]  

#设置x2（及最上边轴）在103处的别名
#set x2tics ("×103" 103) 

#设置y轴的范围
set yrange [0.01:100]

#设置y轴的刻度宽度
#set ytics 0,.5,2
set nonlinear y via log10(y) inverse 10**y 
#set ytics (0, 0.01, 0.1, 3)
set log y

#设置在此位置显示的别名
set ytics add ("0" 0.01, "0.1" 0.1, "1" 1, "10" 10, "100" 100) 

#画图
plot "ec3600-g72-check75.txt" using 2:xticlabels(1) linecolor rgb "#F36767",\
'' using 3:xticlabels(1) linecolor rgb "#95ABDB",\
'' using 4:xticlabels(1) linecolor rgb "#6CEE82"
#'' using 0:2:2 with labels font ",12" rotate by -90 offset -1.4,0.9,\
#'' using 0:3:3 with labels font ",12" rotate by -90 offset 0,0.9,\
#'' using 0:4:4 with labels font ",12" rotate by -90 offset 1.3,0.9


set terminal postscript eps color
set terminal postscript eps size 100,400
set terminal postscript eps fontscale 2
set output "ec3600-g72-check75.eps"
replot

#quit	