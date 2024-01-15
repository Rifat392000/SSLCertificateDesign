#  Intrusion Prevention System (IPS)

```
sudo apt install ufw
```
>This sets the default policy for outgoing traffic to
"allow," permitting any outgoing connections

```
sudo ufw default allow outgoing
```
>This sets the default policy for incoming traffic to
"deny," blocking all incoming connections unless explicitly allowed

```
sudo ufw default deny incoming
```

```
sudo ufw enable
```
>This opens port 80 for incoming HTTP traffic, typically used for
web servers

```
sudo ufw allow 80
```
>This opens port 443 for incoming HTTPS traffic, the secure
version of HTTP

```
sudo ufw allow 443
```
>This opens port 53 for incoming DNS traffic, used for domain
name resolution

```
sudo ufw allow 53
```
>This opens port 3000, which have chosen for SSH access.
However, note that this command alone doesn't change the SSH daemon's listening
port

```
sudo ufw allow 3000
```