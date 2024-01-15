```
sudo apt install openssh-server
```
```
sudo service ssh start
```
```
sudo service ssh enable
```
```
sudo gedit /etc/ssh/sshd_config
```
```
sudo service ssh status
sudo service ssh restart
sudo service ssh status
```
```
ssh rifat@192.168.56.5 -p 3000
```
```
scp -P 3000 rifat@192.168.56.5:/home/rifat/ca/generated/ca.crt /home/cse487/Downloads
```
```
scp -r -P 3000 rifat@192.168.56.5:/home/rifat/share /home/cse487/Downloads
```



