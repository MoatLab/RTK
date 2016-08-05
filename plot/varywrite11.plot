set term postscript eps color 20
set title "CDF of Read"
set key right bottom
set xrange [0:1]
#set yrange [0.9:1]
set xlabel "Latency (ms)"
set output "eps/varywrite11.eps"
plot \
'dat/varywrite11/0_5KRPS_11_lat.dat' u ($1/1000):2 title "5KRPS" w l lc rgb "gray" lw 8, \
'dat/varywrite11/1_90KRPS_11_lat.dat' u ($1/1000):2 title "90KRPS" w l lc rgb "green" lw 8, \
'dat/varywrite11/2_5KRPS-60KB_11_lat.dat' u ($1/1000):2 title "5KRPS-60KB" w l lc rgb "blue" lw 8, \
'dat/varywrite11/3_5KRPS-100KB_11_lat.dat' u ($1/1000):2 title "5KRPS-100KB" w l lc rgb "red" lw 8, \
'dat/varywrite11/4_5KWPS_11_lat.dat' u ($1/1000):2 title "5KWPS" w l lc rgb "pink" lw 8, \
