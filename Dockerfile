FROM alpine:3.13.1

RUN adduser grype --disabled-password --no-create-home
COPY ./grype /usr/local/bin/grype

USER grype
CMD sleep 3600