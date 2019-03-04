FROM ubuntu

WORKDIR /scapy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -qq -y python3 python3-pip tcpdump libpcap-dev iproute2 procps bash-completion bridge-utils curl dnsmasq ebtables host htop iftop iotop ipcalc iperf iperf3 iproute2 ipset iptables iputils-arping iputils-ping less lsof nano net-tools netbase netcat netstat-nat nmap tcpdump tcpreplay traceroute wget ethtool dsniff graphviz imagemagick python3-matplotlib python3-cryptography python3-pyx python3-scapy
RUN apt-get clean
RUN pip3 install --no-cache-dir -U pip
RUN pip3 install --no-cache-dir rpyc==3.4.4 scapy cryptography vpython
RUN echo 'iptables -A OUTPUT -p tcp --tcp-flags RST RST -j DROP' >> /bootstrap.sh
RUN echo 'iptables -L' >> /bootstrap.sh
RUN echo 'sleep infinity' >> /bootstrap.sh
RUN chmod +x /bootstrap.sh

CMD /bootstrap.sh
