# nginx SSL termination

and redirect to upstream backend

run this
```
sudo apt install snapd
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx

YOUR_SITE="set.your.site.here"

echo "
server {
  location / {
      proxy_pass http://upstream_backend:port;
  }


    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot

    ssl_certificate /etc/letsencrypt/live/$YOUR_SITE/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/$YOUR_SITE/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
" | sudo tee -a /etc/nginx/sites-available/default
```

and fix the nginx config `/etc/nginx/sites-available/default`

