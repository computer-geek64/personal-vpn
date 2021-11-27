# Dockerfile

FROM kylemanna/openvpn
WORKDIR /code
RUN apk add curl
COPY . .
ARG vpn_server_ip=127.0.0.1
ENV VPN_SERVER_IP=${vpn_server_ip}
ARG vpn_server_port=1194
ENV VPN_SERVER_PORT=${vpn_server_port}
CMD test -z "$(ls -A /etc/openvpn)" && src/init.sh; ovpn_run
