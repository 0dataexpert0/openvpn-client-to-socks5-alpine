<p># openvpn-client-to-socks5-alpine<br />Docker container on Alpine with Openvpn network to local or remote socks5 proxy<br />git clone https://github.com/0dataexpert0/openvpn-client-to-socks5-alpine.git /docker-vpn-proxy1<br />cd /docker-vpn-proxy1<br />edit in file Dockerfile username and password to your<br />edit in file start 3 arg. <br />PR1=vpn-proxy1<br />port1=6001<br />also edit port 6002 in line<br />socat TCP-LISTEN:6002,fork TCP:127.0.0.1:$port1 &amp;<br />to port which do you want to use for connecting to proxy<br />vpn config upload to directory /docker-vpn-proxy1 and rename to ovpn.conf<br />if you need user name vpn authorisation edit ovpn.conf<br />line<br />"auth-user-pass"<br />to<br />"auth-user-pass /etc/openvpn/pass.txt"<br />edit file pass.txt<br />add<br />user<br />password</p>
<p>for example</p>
<p>anton<br />pardon02</p>
