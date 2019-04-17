import numpy as np
import matplotlib.pyplot as plt
nodes = [20,40,60,80,100]


def read_header(fp):
    return fp.readline().split(',')


energy_fp = open('./awk/csv/more_energy.csv','r')
tput_fp = open('./awk/csv/more_throughput.csv')
pdr_fp = open('./awk/csv/more_pdr.csv')
edelay_fp = open('./awk/csv/e2e_final.csv')

energy_fp1 = open('./awk/csv/energy.csv','r')
tput_fp1 = open('./awk/csv/throughput.csv')
pdr_fp1 = open('./awk/csv/pdr.csv')
edelay_fp1 = open('./awk/csv/e2edelay.csv')

energy_hdr = read_header(energy_fp)
tput_hdr = read_header(tput_fp)
pdr_hdr = read_header(pdr_fp)
e2e_hdr = read_header(edelay_fp)
ed = np.loadtxt(energy_fp,delimiter=',')
tput_data = np.loadtxt(tput_fp,delimiter=',')
edelay_data = np.loadtxt(edelay_fp,delimiter=',')
pdr_data = np.loadtxt(pdr_fp,delimiter=',')

energy_hdr = read_header(energy_fp1)
tput_hdr = read_header(tput_fp1)
pdr_hdr = read_header(pdr_fp1)
e2e_hdr = read_header(edelay_fp1)
# def run():
ed1 = np.loadtxt(energy_fp1,delimiter=',')
tput_data1 = np.loadtxt(tput_fp1,delimiter=',',dtype=object)
edelay_data1 = np.loadtxt(edelay_fp1,delimiter=',',dtype=object)
pdr_data1 = np.loadtxt(pdr_fp1,delimiter=',',dtype=object)


tput_dsdv=[]
tput_dsr=list()
tput_aodv = list()
for i in range(0,25,5):
    tput_dsdv.append(sum(tput_data1[i:i+5,0].astype(np.float))/5)
    tput_dsr.append(sum(tput_data1[i:i+5,1].astype(np.float))/5)
    tput_aodv.append(sum(tput_data1[i:i+5,2].astype(np.float))/5)

dsdv_e2e=[]
dsr_e2e=[]
aodv_e2e=[]
olsr_e2e=[]
for i in range(0,25,5):
    dsdv_e2e.append(sum(edelay_data1[i:i+5,0].astype(np.float))/5)
    dsr_e2e.append(sum(edelay_data1[i:i+5,1].astype(np.float))/5)
    aodv_e2e.append(sum(edelay_data1[i:i+5,2].astype(np.float))/5)
    olsr_e2e.append(sum(edelay_data1[i:i+5,3].astype(np.float))/5)


dsdv_energy = []
dsr_energy=[]
aodv_energy=[]
olsr_energy=[]
for i in range(0,25,5):
    dsdv_energy.append(sum(ed1[i:i+5,0]/ed1[i:i+5,1])/5)
    dsr_energy.append(sum(ed1[i:i+5,2]/ed1[i:i+5,3])/5)
    aodv_energy.append((sum(ed1[i:i+5,4]/ed1[i:i+5,5])/5))
    olsr_energy.append((sum(ed1[i:i+5,6]/ed1[i:i+5,7])/5))

dsdv_pdr = []
dsr_pdr = []
aodv_pdr = []
olsr_pdr=[]
for i in range(0,25,5):
    dsdv_pdr.append(sum(pdr_data1[i:i+5,0].astype(np.float))/5)
    dsr_pdr.append(sum(pdr_data1[i:i+5,1].astype(np.float))/5)
    aodv_pdr.append(sum(pdr_data1[i:i+5,2].astype(np.float))/5)
    olsr_pdr.append(sum(pdr_data1[i:i+5,3].astype(np.float))/5)


def plot_other(nodes, dsdv,dsr,aodv,fig_title,labelx,labely):
    plt.plot(nodes, dsdv,'v-',label='DSDV')
    plt.plot(nodes, dsr,'rx-',label='DSR')
    plt.plot(nodes,aodv,'o-',label='AODV')
    plt.title(fig_title)
    plt.xlabel(labelx)
    plt.ylabel(labely)
    plt.legend()
    plt.show()

def plot(nodes, dsdv,dsr,aodv,olsr,fig_title,labelx,labely):
    plt.plot(nodes, dsdv,'v-',label='DSDV')
    plt.plot(nodes, dsr,'rx-',label='DSR')
    plt.plot(nodes,aodv,'o-',label='AODV')
    plt.plot(nodes,olsr,'g-+',label='OLSR')
    plt.title(fig_title)
    plt.xlabel(labelx)
    plt.ylabel(labely)
    plt.ylim([5,80])
    plt.legend()
    plt.show()

def plot_tput(dsdv,dsr,aodv,olsr,fig_title,labelx,labely):
    plt.plot(dsdv,'v-',label='DSDV')
    plt.plot(dsr,'rx-',label='DSR')
    plt.plot(aodv,'o-',label='AODV')
    plt.plot(olsr,'g-+',label='OLSR')
    plt.title(fig_title)
    plt.xlabel(labelx)
    plt.ylabel(labely)
    plt.ylim(50,90)
    plt.legend()
    plt.show()

# plot(nodes,dsdv_pdr,dsr_pdr,aodv_pdr,olsr_pdr,"Packet delivery Ratio","Number of nodes","pdr")
# plot(nodes,dsdv_energy,dsr_energy,aodv_energy,olsr_energy,"Energy Consumption","Number of nodes","Energy Consumed per packet")
# plot(nodes,dsdv_e2e,dsr_e2e,aodv_e2e,olsr_e2e,"End-to-End Delay","Number of nodes","e2e delay")
# plot_tput(nodes,tput_dsdv,tput_dsr,tput_aodv,"Throughput","Number of nodes","throughput")
# plot(nodes,pdr_data[:,0],pdr_data[:,1].flatten(),pdr_data[:,2].flatten(),pdr_data[:,3].flatten(),"Packet delivery Ratio","Number of nodes","pdr")
# plot(nodes,ed[:,0],ed[:,2],ed[:,4],ed[:,6],"Energy Consumption","Number of nodes","Energy Consumed")
# plot(nodes,ed[:,0]/ed[:,1],ed[:,2]/ed[:,3],ed[:,4]/ed[:,5],ed[:,6]/ed[:,7],"Energy Consumption","Number of nodes","Energy Consumed per packet")
plot(nodes,edelay_data[:,0],edelay_data[:,1],edelay_data[:,2],edelay_data[:,3],"End-to-End Delay","Number of nodes","e2e delay")
# plot(nodes,tput_data[:,0],tput_data[:,1],tput_data[:,2],tput_data[:,3],"Throughput","Number of nodes","throughput")
