BEGIN {
sent = 0;
recvd = 0;

}
# Search for sent packets
$0 ~/^r.* AGT/ {
recvd ++ ;
}
# Search for sent packets
$0 ~/^s.* AGT/ {
sent ++ ;
}



END {
printf "Packet Delivery Ratio : %.4f\n", (recvd/sent);
}
