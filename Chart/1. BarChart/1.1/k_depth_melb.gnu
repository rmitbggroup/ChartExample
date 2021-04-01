set terminal postscript enhanced "Arial,32"

set output '\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\barchart\k_depth.ps'

set xlabel 'Depth k of exact result'
set ylabel '% of result overlap'
set yrange [0:130]
set xtics nomirror (10,20,30,40,50,75,100,150,200) rotate by 60 center offset 0,-0.45 

 
set ytics nomirror (0,20,40,60,80,100)

set key top left
set key vertical 
set style data histogram
set style histogram cluster gap 1.5
set style fill solid border
set boxwidth 0.9

#plot newhistogram "10" 'k_depth_m50.txt' using 3:xticlabels(1) title "10"  fs solid 1 , '' us 6:xticlabels(1) notitle  fs pattern 2 


plot '\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\barchart\m_depth_graph_data.txt' using 2:xticlabels(1) title "m=10" fs solid 1 fc rgb "red",\
'\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\barchart\m_depth_graph_data.txt' using 3:xticlabels(1) title "m=50" fs solid 1 fc rgb "blue",\
'\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\barchart\m_depth_graph_data.txt' using 4:xticlabels(1) title "m=100" fs solid 1 fc rgb "green"
pause -1
