# OpenSSH
## Server 
### Install the OpenSSH server
```bash
sudo apt install openssh-server 
```
### Start the OpenSSH server
```bash
sudo service ssh start
```
### Enable the OpenSSH server
```bash
sudo service ssh enable
```
### Status check OpenSSH server
```bash
sudo service ssh status
```
### Configuration file for OpenSSH server
> [!NOTE]
> In my case I changed the default port number 22 to 3000
```bash
sudo gedit /etc/ssh/sshd_config
```
### Restart OpenSSH server
```bash
sudo service ssh restart
```
### Status check OpenSSH server
```bash
sudo service ssh status
```
### Check ip addres 
```bash
ip addr
ifconfig
```
## Client 
### Connected to the server 
```bash
ssh rifat@192.168.56.5 -p 3000
```
### Copy files
***syntax***
>scp -P port_number ServerName@ServerAddress:copy_path  destination_path
```bash
scp -P 3000 rifat@192.168.56.5:/home/rifat/ca/generated/ca.crt /home/cse487/Downloads
```
### Copy directories or folders
```bash
scp -r -P 3000 rifat@192.168.56.5:/home/rifat/share /home/cse487/Downloads
```



