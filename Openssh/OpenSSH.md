## Install the OpenSSH Server
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
## Configureation File OpenSSH Server
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
## Client 

```
ssh rifat@192.168.56.5 -p 3000
```
```
scp -P 3000 rifat@192.168.56.5:/home/rifat/ca/generated/ca.crt /home/cse487/Downloads
```
```
scp -r -P 3000 rifat@192.168.56.5:/home/rifat/share /home/cse487/Downloads
```



