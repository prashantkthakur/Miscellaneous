#for j in `ls *.tcl`; do for i in {1..5}; do eaa 2>/dev/null || while [ $? != 0 ]; do ns $j; done && mv tr/$(echo $j|sed 's/tcl/tr/g'){,_$i}; done;done



#for i in {1..5}; do eaa 2>/dev/null || while [ $? != 0 ]; do ns dsr_udp.tcl; done && mv ./tr/dsr_udp80.tr{,_$i}; done
#sleep 10
#for i in {1..5}; do eaa 2>/dev/null || while [ $? != 0 ]; do ns dsr_udp.tcl; done && mv ./tr/dsr_udp80.tr{,_$i}; done

# Throughput DSR
cd ~/Documents/cs557-project/codes/awk
echo 'DSR Throughput' >> more_throughput.csv

for i in `ls ../tr/dsr_udp20_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsr_udp40_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsr_udp60_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsr_udp80_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsr_udp100_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv

#AODV
echo 'AODV. Throughput' >> more_throughput.csv
for i in `ls ../tr/aodv_udp20_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/aodv_udp40_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/aodv_udp60_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/aodv_udp80_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/aodv_udp100_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv


#DSDV
echo 'DSDV Throughput' >> more_throughput.csv

for i in `ls ../tr/dsdv_udp20_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsdv_udp40_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsdv_udp60_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsdv_udp80_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/dsdv_udp100_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv

echo 'olsr Throughput' >> more_throughput.csv
for i in `ls ../tr/olsr_udp20_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/olsr_udp40_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv
for i in `ls ../tr/olsr_udp60_more.tr`; do echo $i && awk -f throughput.awk $i; done | grep Average|awk '{print $4}' >> more_throughput.csv


#Energy
echo "DSDV Energy">> more_energy.csv
for i in `ls ../tr/dsdv_udp20_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsdv_udp40_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsdv_udp60_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsdv_udp80_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsdv_udp100_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv

echo "DSR Energy">> more_energy.csv
for i in `ls ../tr/dsr_udp20_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsr_udp40_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsr_udp60_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsr_udp80_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/dsr_udp100_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv


echo "AODV Energy" >> more_energy.csv
for i in `ls ../tr/aodv_udp20_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/aodv_udp40_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/aodv_udp60_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/aodv_udp80_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/aodv_udp100_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv

echo "olsr Energy" >> more_energy.csv
for i in `ls ../tr/olsr_udp20_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/olsr_udp40_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv
for i in `ls ../tr/olsr_udp60_more.tr`; do echo $i && awk -f energy.awk $i; done|grep total|awk '{print $3}' >> more_energy.csv


#Count
echo 'DSDV Count' >> more_energy.csv
for i in `ls ../tr/dsdv_udp20_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsdv_udp40_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsdv_udp60_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsdv_udp80_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsdv_udp100_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
echo 'DSR Count' >> more_energy.csv
for i in `ls ../tr/dsr_udp20_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsr_udp40_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsr_udp60_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsr_udp80_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/dsr_udp100_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
echo 'AODV Count' >> more_energy.csv
for i in `ls ../tr/aodv_udp20_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/aodv_udp40_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/aodv_udp60_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/aodv_udp80_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/aodv_udp100_more.tr`; do grep ^r $i|grep AGT|grep cbr |wc -l; done >> more_energy.csv
echo "OLSR COUNT" >> more_energy.csv
for i in `ls ../tr/olsr_udp20_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/olsr_udp40_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
for i in `ls ../tr/olsr_udp60_more.tr`; do grep ^r $i |grep AGT|grep cbr |wc -l; done >> more_energy.csv
#PDR
echo "PDR DSDV" >> more_pdr.csv
for i in `ls ../tr/dsdv_udp20_more.tr`; do echo $i && awk -f pdr.awk $i; done | grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsdv_udp40_more.tr`; do echo $i && awk -f pdr.awk $i; done | grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsdv_udp60_more.tr`; do echo $i && awk -f pdr.awk $i; done | grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsdv_udp80_more.tr`; do echo $i && awk -f pdr.awk $i; done | grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsdv_udp100_more.tr`; do echo $i && awk -f pdr.awk $i; done | grep Ratio|awk '{print $2}' >> more_pdr.csv

echo DSR >> more_pdr.csv
for i in `ls ../tr/dsr_udp20_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsr_udp40_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsr_udp60_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsr_udp80_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/dsr_udp100_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv

echo AODV >> more_pdr.csv
for i in `ls ../tr/aodv_udp20_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/aodv_udp40_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/aodv_udp60_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/aodv_udp80_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/aodv_udp100_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv

echo OLSR >> more_pdr.csv
for i in `ls ../tr/olsr_udp20_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/olsr_udp40_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv
for i in `ls ../tr/olsr_udp60_more.tr`; do echo $i && awk -f pdr.awk $i; done |grep Ratio|awk '{print $2}' >> more_pdr.csv

# E2E
echo DSDV >> more_e2edelay.csv
for i in `ls ../tr/dsdv_udp20*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsdv_udp40*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsdv_udp60*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsdv_udp80*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsdv_udp100*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >>more_e2edelay.csv
echo DSR >> more_e2edelay.csv
for i in `ls ../tr/dsr_udp20*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsr_udp40*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsr_udp60*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsr_udp80*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/dsr_udp100*_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >>more_e2edelay.csv
echo AODV >> more_e2edelay.csv
for i in `ls ../tr/aodv_udp20_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/aodv_udp40_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/aodv_udp60_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/aodv_udp80_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/aodv_udp100_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >>more_e2edelay.csv

echo olsr >> more_e2edelay.csv
for i in `ls ../tr/olsr_udp20_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/olsr_udp40_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
for i in `ls ../tr/olsr_udp60_more.tr`; do echo $i && awk -f e2edelay.awk $i; done | grep Average | awk '{print $6}' >> more_e2edelay.csv
