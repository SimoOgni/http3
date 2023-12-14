FROM patrikjuvonen/docker-nginx-http3:latest

# Copy your certs.
COPY ./ssl/private.pem /etc/ssl/private/
COPY ./ssl/cert.pem /etc/ssl/

# Copy your configs.
COPY nginx.conf /etc/nginx/
COPY h3.nginx.conf /etc/nginx/conf.d/

EXPOSE 80 443 443/udp