set terminal postscript enhanced color "Arial,30"
set output '\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\Lineplot\time.ps'

set size square 1,1
set xlabel 'm'
set ylabel 'RPQ (ms)'

set pointsize 0.7
unset key
set key top left
set key vertical

set xtics ("1" 0, "5" 1, "10" 2, "20" 3, "50" 4, "100" 5)
set xtics nomirror
set yrange [0:80] 
set ytics nomirror (0,20,40,60,80)
plot '\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\Lineplot\time_m_mean.txt' using 1:3 title "BS(U)" with lp pointtype 5 lt 1 ps 2.5 lc rgb 'red', '\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\Lineplot\time_m_mean.txt' using 1:4 title "BS(S)" with lp pointtype 7 lt 1 ps 2.5 lc rgb 'orange',
'\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\Lineplot\time_m_mean.txt' using 1:5 title "AP(U)" with lp pointtype 9 lt 1 ps 2.5 lc rgb 'blue',
'\\ntapprdfs01n02.rmit.internal\eh7\e36467\Configuration\Desktop\training\gnuplot\gnuplot\Lineplot\time_m_mean.txt' using 1:6 title "AP(S)" with lp pointtype 13 lt 1 ps 2.5 lc rgb 'forest-green'
pause -1


 
 

