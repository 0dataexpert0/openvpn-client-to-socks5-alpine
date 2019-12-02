# openvpn-client-to-socks5-alpine
Docker container on Alpine with Openvpn network to local or remote socks5 proxy
git clone https://github.com/0dataexpert0/openvpn-client-to-socks5-alpine.git /docker-vpn-proxy1
cd /docker-vpn-proxy1
edit in file Dockerfile username and password to your
edit in file start 3 arg. 
PR1=vpn-proxy1
port1=6001
also edit port 6002 in line
socat TCP-LISTEN:6002,fork TCP:127.0.0.1:$port1 &
to port which do you want to use for connecting to proxy
vpn config upload to directory /docker-vpn-proxy1 and rename to ovpn.conf
if you need user name vpn authorisation edit ovpn.conf
line
"auth-user-pass"
to
"auth-user-pass /etc/openvpn/pass.txt"
edit file pass.txt
add
user
password

for example

anton
pardon02
