FROM postgres:alpine

ADD https://github.com/brimstone/traefik-cert/releases/download/0.3.0/traefik-cert_linux_amd64 /usr/local/bin/traefik-cert
#COPY traefik-cert /usr/local/bin/traefik-cert
RUN chmod 755 /usr/local/bin/traefik-cert

RUN apk -U add ca-certificates

COPY hostssl.sh /docker-entrypoint-initdb.d/hostssl.sh

ENV CERT=/tmp/server.crt \
    KEY=/tmp/server.key \
    OWNER=postgres:

CMD []
ENTRYPOINT ["/usr/local/bin/traefik-cert", "exec", "--", \
            "docker-entrypoint.sh", "postgres", \
            "-c", "ssl=on", \
            "-c", "ssl_cert_file=/tmp/server.crt", \
            "-c", "ssl_key_file=/tmp/server.key" \
           ]
