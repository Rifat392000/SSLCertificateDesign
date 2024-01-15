# Nginx Webserver Configuration

```
sudo apt update
```

```
sudo apt install nginx
```

```
sudo systemctl status nginx
```

```
sudo systemctl enable nginx
```

```
sudo systemctl start nginx
```

```
sudo systemctl status nginx
```

```
sudo cp -r ewubdserver /var/www
```

```
cd ~
```

```
cd /var/www
```

```
sudo chmod -R 755 ewubdserver
```

```
cd /etc/nginx/sites-enabled
```

```
sudo rm default
```

```
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

```
sudo service nginx restart
```

```
sudo systemctl status nginx
```

```
sudo systemctl stop nginx
```

```
sudo systemctl disable nginx
```
