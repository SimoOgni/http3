# HTTP/3 Nginx Docker Server

Questo repository contiene un Dockerfile e configurazioni per avviare un server HTTP/3 basato su Nginx. Utilizza l'immagine Docker [`patrikjuvonen/docker-nginx-http3:latest`](https://hub.docker.com/r/patrikjuvonen/docker-nginx-http3) come base e configura il supporto per HTTP/3 con certificati SSL/TLS.

## Contenuto

- **Dockerfile**: Configura un container Nginx con supporto HTTP/3.
- **Certificati SSL**: I certificati SSL sono copiati nella directory del container per abilitare HTTPS.
- **Configurazioni Nginx**: Configurazioni personalizzate per HTTP/3 sono incluse.

## Prerequisiti

- Docker installato.
- Certificati SSL/TLS (`private.pem` e `cert.pem`) posizionati nella directory `ssl/` del progetto.
- File di configurazione Nginx (`nginx.conf` e `h3.nginx.conf`) per gestire la configurazione base e quella specifica per HTTP/3.

## Struttura del Progetto

```plaintext
.
├── Dockerfile
├── ssl/
│   ├── private.pem
│   └── cert.pem
├── nginx.conf
└── h3.nginx.conf
```

## Configurazione

- **`nginx.conf`**: Configurazione principale di Nginx.
- **`h3.nginx.conf`**: Configurazione specifica per HTTP/3, da includere come file `.conf` in `/etc/nginx/conf.d/`.

## Come Utilizzare

1. Posiziona i certificati SSL/TLS in `ssl/private.pem` e `ssl/cert.pem`.
2. Posiziona i file di configurazione di Nginx nella root del progetto (`nginx.conf` e `h3.nginx.conf`).
3. Costruisci l'immagine Docker:
   ```bash
   docker build -t nginx-http3-server .
   ```
4. Avvia il container:
   ```bash
   docker run -p 80:80 -p 443:443 -p 443:443/udp nginx-http3-server
   ```

## Porte Esposte

- `80`: HTTP
- `443`: HTTPS
- `443/udp`: Supporto per HTTP/3 tramite QUIC.

## Note

- Assicurati che i certificati SSL/TLS siano validi e corrispondano al dominio del server (considera l'utilizzo di `certbot`).
- Modifica i file di configurazione di Nginx in base alle tue esigenze.

## Risorse

- [Documentazione di Nginx](https://nginx.org/en/docs/)
- [Documentazione su HTTP/3 e QUIC](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview_of_HTTP)
- [Docker Hub - patrikjuvonen/docker-nginx-http3](https://hub.docker.com/r/patrikjuvonen/docker-nginx-http3)

## Licenza

Questo progetto è distribuito sotto la licenza MIT. Vedi il file `LICENSE` per maggiori dettagli.
