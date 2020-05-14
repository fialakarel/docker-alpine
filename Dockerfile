# base image
FROM alpine:latest

# maintainer
MAINTAINER Karel Fiala <fiala.karel@gmail.com>

# fix locales and set vars
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    TERM="xterm" \
    EDITOR="vi" \
    TZ="Europe/Prague" \
    SHELL="/bin/sh" \
    PATH="/opt/bin:$PATH"

RUN    mkdir -p /opt/bin \
    && chmod -R 777 /opt \
    && echo "Europe/Prague" >/etc/timezone \
    && apk --no-cache add dumb-init

# set entrypoint
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/bin/sh"]
