BEGIN {
       hpkt_id =0;
       sum=0;
       recvnum=0;
     }

  {
  time = $3;
  pkt_id = $41;



  # CALCULATE DELAY
   if (( $1 == "s") &&  ( $19=="AGT" ) && ( $35== "cbr" ))
stime[pkt_id] = time;
  if (( $1 == "r") && ( $19=="AGT" ) &&  ( $35== "cbr" )) {
etime[pkt_id] = time;  }



       #find the number of packets in the simulation
          if (pkt_id > hpkt_id)
             hpkt_id = pkt_id;
  }

  END {

  for ( i in etime )
  {
  start = stime[i];
  end = etime[i];
  pkt_duration = end - start;
  if ( pkt_duration > 0 )
  {    sum += pkt_duration;
       recvnum++;
  }
  }

     delay=sum/recvnum;

     printf("Average end to end delay(ms)= %.2f\n",delay*1000);

  }