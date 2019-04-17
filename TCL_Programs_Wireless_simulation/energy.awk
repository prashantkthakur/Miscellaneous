
BEGIN {
initial_energy = 100
max_energy=0
node_id=100
}
{
event = $1
time = $2
if (event == "r" || event == "d" || event =="s"|| event=="f") {
node_id = $9
energy=$17
}
if (event=="N"){
node_id = $5
energy=$7
}
# Store remaining energy
final_energy[node_id]=energy
}
END {
# Compute consumed energy for each node
for (i in final_energy) {
consume_energy[i]=initial_energy-final_energy[i]
total_energy +=consume_energy[i]
if(max_energy<consume_energy[i]){
max_energy=consume_energy[i]
node_id=i
}
}

print("total energy",total_energy)

}
