## Server 
### Install the OpenSSH Server
```
sudo apt install openssh-server
```
### Start the OpenSSH server
```
sudo service ssh start
```
### Enable the OpenSSH server
```
sudo service ssh enable
```
### Status check OpenSSH server
```
sudo service ssh status
```
### Configureation file for OpenSSH Server
> [!NOTE]
> In my case I changed the default port number 22 to 3000
```
sudo gedit /etc/ssh/sshd_config
```
### Restart OpenSSH server
```
sudo service ssh restart
```
### Status check OpenSSH server
```
sudo service ssh status
```
### Check ip addres 
```
ip addr
ifconfig
```
## Client Machine
### Connected to the server 
```
ssh rifat@192.168.56.5 -p 3000
```
### Copy files
***syntax***
>scp -P port_number ServerName@ServerAddress:copy_path  destination_path
```
scp -P 3000 rifat@192.168.56.5:/home/rifat/ca/generated/ca.crt /home/cse487/Downloads
```
### Copy directories or folders
```
scp -r -P 3000 rifat@192.168.56.5:/home/rifat/share /home/cse487/Downloads
```



