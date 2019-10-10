FROM debian:buster-slim

MAINTAINER thas thascc1024@gmail.com

RUN apt-get update \
&& apt-get -y install wget tar make gcc zlib1g-dev libpcre3 libpcre3-dev openssl libssl-dev perl procps 

RUN wget https://www.openssl.org/source/openssl-1.1.1d.tar.gz \
&& tar xzf openssl-1.1.1d.tar.gz \
&& wget https://nginx.org/download/nginx-1.17.4.tar.gz \
&& tar xzf nginx-1.17.4.tar.gz

RUN cd nginx-1.17.4 \
&& ./configure \
--with-stream \
--with-stream_ssl_module \
--with-stream_realip_module \
--with-stream_ssl_preread_module \
--with-openssl=../openssl-1.1.1d \
&& make && make install

RUN rm -rf /nginx-1.17.4.tar.gz && rm -rf /openssl-1.1.1d.tar.gz

## 备份 避免映射volume后无法启动
RUN mkdir /thas \
&& mkdir /thas/nginx && cp -r /usr/local/nginx/conf /thas/nginx

COPY start.sh /data/start.sh
COPY stop.sh /data/stop.sh
COPY entry.sh /data/entry.sh

RUN chown root:root /data/*.sh && chmod 700 /data/*.sh

WORKDIR /data

VOLUME /usr/local/nginx/conf

ENTRYPOINT ["/data/entry.sh"]



