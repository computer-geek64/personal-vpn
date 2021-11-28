# Dockerfile

FROM kylemanna/openvpn
WORKDIR /code
RUN apk update
RUN apk add curl openssh
COPY . .
ARG vpn_server_addr=127.0.0.1
ENV VPN_SERVER_ADDR=${vpn_server_addr}
ARG vpn_server_port=1194
ENV VPN_SERVER_PORT=${vpn_server_port}
CMD test -z "$(ls -A /etc/openvpn)" && src/init.sh; ovpn_run
