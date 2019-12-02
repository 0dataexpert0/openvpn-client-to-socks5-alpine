FROM alpine

COPY sockd.sh /usr/local/bin/

RUN true \
    && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --update-cache dante-server openvpn nano curl net-tools bash openresolv openrc \
    && rm -rf /var/cache/apk/* \
    && chmod a+x /usr/local/bin/sockd.sh \
    && true

ARG user=anton
ARG password=pardon02

ENV PROXY_USER $user
ENV PROXY_PASSWORD $password

RUN adduser -S -H ${PROXY_USER} \
    && echo "${PROXY_USER}:${PROXY_PASSWORD}" | chpasswd




COPY sockd.conf /etc/
COPY pass.txt /etc/openvpn/
COPY ./ovpn.conf /
COPY ./ovpn.conf /etc/openvpn/
COPY up.sh /etc/openvpn/
COPY down.sh /etc/openvpn/
ENTRYPOINT [ \
    "/bin/bash", "-c", \
    "cd /etc/openvpn && /usr/sbin/openvpn --config ovpn.conf --script-security 2 --up /usr/local/bin/sockd.sh" \
    ]
