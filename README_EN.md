# HTTP/3 Nginx Docker Server

This repository contains a Dockerfile and configurations to launch an HTTP/3 server based on Nginx. It uses the Docker image [`patrikjuvonen/docker-nginx-http3:latest`](https://hub.docker.com/r/patrikjuvonen/docker-nginx-http3) as a base and configures HTTP/3 support with SSL/TLS certificates.

## Contents

- **Dockerfile**: Configures an Nginx container with HTTP/3 support.
- **SSL Certificates**: SSL certificates are copied into the container directory to enable HTTPS.
- **Nginx Configurations**: Custom configurations for HTTP/3 are included.

## Prerequisites

- Docker installed.
- SSL/TLS certificates (`private.pem` and `cert.pem`) placed in the project's `ssl/` directory.
- Nginx configuration files (`nginx.conf` and `h3.nginx.conf`) to manage the base configuration and HTTP/3 specifics.

## Project Structure

```plaintext
.
├── Dockerfile
├── ssl/
│   ├── private.pem
│   └── cert.pem
├── nginx.conf
└── h3.nginx.conf
```

## Configuration

- **`nginx.conf`**: Primary Nginx configuration.
- **`h3.nginx.conf`**: HTTP/3 specific configuration, to be included as a `.conf` file in `/etc/nginx/conf.d/`.

## How to Use

1. Place the SSL/TLS certificates in `ssl/private.pem` and `ssl/cert.pem`.
2. Place the Nginx configuration files in the project root (`nginx.conf` and `h3.nginx.conf`).
3. Build the Docker image:
   ```bash
   docker build -t nginx-http3-server .
   ```
4. Run the container:
   ```bash
   docker run -p 80:80 -p 443:443 -p 443:443/udp nginx-http3-server
   ```

## Exposed Ports

- `80`: HTTP
- `443`: HTTPS
- `443/udp`: HTTP/3 support via QUIC.

## Notes

- Ensure that the SSL/TLS certificates are valid and match the server's domain.
- Modify Nginx configuration files according to your requirements.

## Resources

- [Nginx Documentation](https://nginx.org/en/docs/)
- [HTTP/3 and QUIC Documentation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview_of_HTTP)
- [Docker Hub - patrikjuvonen/docker-nginx-http3](https://hub.docker.com/r/patrikjuvonen/docker-nginx-http3)

## License

This project is distributed under the MIT license. See the `LICENSE` file for more details.
