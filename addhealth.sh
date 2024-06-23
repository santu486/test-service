#!/bin/bash

# Install Nginx
#sudo apt-get update
#sudo apt-get install -y nginx

# Update nginx.conf
cat <<EOL > /etc/nginx/nginx.conf
# Your custom nginx configuration here
worker_processes 1;

events {
    worker_connections 1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       80;
        server_name  localhost;

        location = /health {
            access_log off;
            add_header 'Content-Type' 'application/json';
            return 200 '{"status":"UP"}';
        }


        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }
		


        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }
    }
}
EOL

# Restart Nginx to apply changes
sudo chmod 777 /etc/nginx
sudo systemctl restart nginx
sudo systemctl stop nginx
