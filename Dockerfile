FROM alpine:3.13.1

RUN wget -qO- https://github.com/anchore/grype/releases/download/v0.7.0/grype_0.7.0_linux_amd64.tar.gz | tar --directory /usr/local/bin -zxf - grype && \
    adduser grype --disabled-password --no-create-home

USER grype
CMD sleep 3600