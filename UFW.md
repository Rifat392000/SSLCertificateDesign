#  Intrusion Prevention System (IPS)

```bash
sudo apt install ufw
```
>Sets the default policy for outgoing traffic to "allow," permitting any outgoing connections

```bash
sudo ufw default allow outgoing
```
>Sets the default policy for incoming traffic to "deny," blocking all incoming connections unless explicitly allowed

```bash
sudo ufw default deny incoming
```

```bash
sudo ufw enable
```
>Opens port 80 for incoming HTTP traffic, typically used for web servers

```bash
sudo ufw allow 80
```
>Opens port 443 for incoming HTTPS traffic, the secure version of HTTP

```bash
sudo ufw allow 443
```
>Opens port 53 for incoming DNS traffic, used for domain name resolution

```bash
sudo ufw allow 53
```
>Opens port 3000, which have chosen for SSH access. However, note that this command alone doesn't change the SSH daemon's listening port

```bash
sudo ufw allow 3000
```