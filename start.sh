#!/bin/sh

if [ ! -f /usr/local/nginx/conf/notfirst ]; then
## 首次启动时补充由于映射volume丢失的文件
cp -r /thas/nginx/conf /usr/local/nginx/
echo '此文件用于表示非首次启动' > /usr/local/nginx/conf/notfirst
fi

export PATH=$PATH:/usr/local/nginx/sbin
## 启动nginx
nginx -c /usr/local/nginx/conf/nginx.conf