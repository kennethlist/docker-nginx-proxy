docker run -d -p 8081:80 --name nginx \
-v /path/nginx/sites-enabled:/etc/nginx/sites-enabled \
-v /path/nginx/certificates:/etc/nginx/certificates \
--link php7 \
docker-nginx