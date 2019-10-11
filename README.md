# docker-nginx-proxy
docker-nginx-proxy

nginx 4层转发 支持ssl preread无证书反向代理https

start with:
```
docker run -d --restart always --name proxy \
-p 443:443 \
-v proxy_nginx:/usr/local/nginx/conf \
thas/docker-nginx-proxy
```
