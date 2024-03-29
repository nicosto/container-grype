FROM nicosto75/alpine:3.15.0-1

LABEL maintainer="container-maintainer@zremal.org"
LABEL "org.zremal"="ZREMAL Inc."
LABEL version="1.0"
LABEL description="Grype container image based on Alpine"

RUN apk --no-progress --quiet --no-cache add curl \
    && curl -s http://192.168.10.56:9090/grype-0.9.0-1.zremal.x86_64.apk -o ./pkg.apk \
    && apk add --no-progress --quiet --no-cache --allow-untrusted ./pkg.apk \
    && apk del --no-progress --quiet --no-cache curl \
    && rm -f ./pkg.apk \
    && adduser scanner --disabled-password --no-create-home

USER scanner

ENTRYPOINT ["/usr/local/bin/grype"] 