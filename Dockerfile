FROM postgres:alpine

ADD https://github.com/brimstone/traefik-cert/releases/download/0.2.0/traefik-cert_linux_amd64 /usr/local/bin/traefik-cert
#COPY traefik-cert /usr/local/bin/traefik-cert
RUN chmod 755 /usr/local/bin/traefik-cert

RUN apk -U add ca-certificates

ENTRYPOINT ["/usr/local/bin/traefik-cert", "exec", "docker-entrypoint.sh"]
