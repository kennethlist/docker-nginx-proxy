FROM debian:jessie

RUN apt-get update && \
    apt-get install -y \
      nginx \
      dnsmasq

COPY configs/nginx.conf /etc/nginx/
COPY configs/proxy.conf /etc/nginx/conf.d/

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME /etc/nginx/sites-enabled
VOLUME /etc/nginx/certificates

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
