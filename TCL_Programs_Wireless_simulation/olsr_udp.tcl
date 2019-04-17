
# Define options
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             20                          ;# number of mobilenodes
set val(rp)             OLSR                       ;# routing protocol
set val(x)              500   			   ;# X dimension of topography
set val(y)              500   			   ;# Y dimension of topography
set val(stop)		200			   ;# time of simulation end

set ns		  [new Simulator]
set tracefd       [open ../codes/tr/olsr_udp20.tr w]
set namtrace      [open ../codes/tr/olsr_udp20.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
$ns use-newtrace
# set up topography object
set topo       [new Topography]

Agent/OLSR set use_mac_    true


$topo load_flatgrid $val(x) $val(y)
set chan_1_ [new $val(chan)]
create-god $val(nn)

# configure the nodes
        $ns node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channel $chan_1_ \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace OFF \
			 -movementTrace OFF

  $ns node-config   -energyModel "EnergyModel" \
					-idlePower 712e-6 \
					-rxPower 0.3 \
					-txPower 0.6 \
					-sleepPower 144e-9 \
					#-transitionPower 0.2 \
					#-transitionTime 0.005 \
					-initialEnergy 100

    for {set i 0} {$i < $val(nn) } { incr i } {
        set node_($i) [$ns node]
        $node_($i) set X_ [ expr 10+round(rand()*480) ]
        $node_($i) set Y_ [ expr 10+round(rand()*380) ]
        $node_($i) set Z_ 0.0
    }

    for {set i 0} {$i < $val(nn) } { incr i } {
        $ns at [ expr 15+round(rand()*60) ] "$node_($i) setdest [ expr 10+round(rand()*480) ] [ expr 10+round(rand()*380) ] [ expr 2+round(rand()*15) ]"

    }


#Setup a UDP connection

set udp [new Agent/UDP]
$ns attach-agent $node_(12) $udp
set null [new Agent/Null]
$ns attach-agent $node_(6) $null
#$ns connect $udp $null
#$udp set fid_ 2


#Setup a CBR over UDP connection

set cbr [new Application/Traffic/CBR]
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 0.1mb
$cbr set random_ false
$cbr attach-agent $udp
$ns connect $udp $null
$ns at 1.0 "$cbr start"
$ns at 200 "$cbr stop"

set udp [new Agent/UDP]
$ns attach-agent $node_(2) $udp
set null [new Agent/Null]
$ns attach-agent $node_(8) $null
#$ns connect $udp $null
#$udp set fid_ 2


#Setup a CBR over UDP connection

set cbr [new Application/Traffic/CBR]
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 0.1mb
$cbr set random_ false
$cbr attach-agent $udp
$ns connect $udp $null
$ns at 1.0 "$cbr start"
$ns at 200 "$cbr stop"

set udp [new Agent/UDP]
$ns attach-agent $node_(4) $udp
set null [new Agent/Null]
$ns attach-agent $node_(10) $null
#$ns connect $udp $null
#$udp set fid_ 2


#Setup a CBR over UDP connection

set cbr [new Application/Traffic/CBR]
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 0.1mb
$cbr set random_ false
$cbr attach-agent $udp
$ns connect $udp $null
$ns at 1.0 "$cbr start"
$ns at 200 "$cbr stop"

# Define node initial position in nam
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation
#$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 200 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run
