# Nginx Webserver Configuration

```bash
sudo apt update
```

```bash
sudo apt install nginx
```

```bash
sudo systemctl status nginx
```

```bash
sudo systemctl enable nginx
```

```bash
sudo systemctl start nginx
```

```bash
sudo systemctl status nginx
```
> [!IMPORTANT]
>Copy ewubdserver website to the /var/www

```bash
sudo cp -r ewubdserver /var/www
```

```bash
cd ~
```

```bash
cd /var/www
```
> [!IMPORTANT]
>Change the permission

```bash
sudo chmod -R 755 ewubdserver
```

```bash
cd /etc/nginx/sites-enabled
```

```bash
sudo rm default
```

```bash
sudo gedit ewubdserver
```

```bash
server {
    listen 80;
    listen [::]:80;

    listen 443 ssl;
    listen [::]:443 ssl;

    server_name ewubdserver;
    
    ssl_certificate /home/rifat/ca/generated/chained.crt;
    ssl_certificate_key /home/rifat/ca/generated/server.key;

    root /var/www/ewubdserver;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

```bash
sudo service nginx restart
```

```bash
sudo systemctl status nginx
```
> [!NOTE]
>If you want to turn off the service, use this command


```bash
sudo systemctl stop nginx
```

```bash
sudo systemctl disable nginx
```

```bash
sudo systemctl status nginx
```
