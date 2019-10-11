#!/bin/sh

if [ ! -f /usr/local/nginx/conf/nginx.conf ]; then
## 首次启动时补充由于映射volume丢失的文件
cp -nr /thas/nginx/conf /usr/local/nginx/
fi

export PATH=$PATH:/usr/local/nginx/sbin
## 启动nginx
nginx -c /usr/local/nginx/conf/nginx.conf