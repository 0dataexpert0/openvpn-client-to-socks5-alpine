#!/bin/bash
set -e
[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"
pidof sockd | xargs --no-run-if-empty kill -TERM
exec /usr/sbin/sockd -f /etc/sockd.conf
