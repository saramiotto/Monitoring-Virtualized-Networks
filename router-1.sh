export DEBIAN_FRONTEND=noninteractive

#Startup commands go here
#Enable routing
sudo sysctl -w net.ipv4.ip_forward=1
#Network and VLAN interface config
sudo ip link add link enp0s8 name enp0s8.2 type vlan id 2
sudo ip link add link enp0s8 name enp0s8.3 type vlan id 3
sudo ip addr add 192.168.0.1/23 dev enp0s8.2
sudo ip addr add 192.168.2.1/23 dev enp0s8.3
sudo ip link set dev enp0s8 up
sudo apt-get install iperf
iperf -s &
