#!/bin/bash
# init.sh

test "${VPN_SERVER_ADDR}" = "127.0.0.1" && VPN_SERVER_ADDR=$(curl -s http://ipecho.net/plain)

ovpn_genconfig -u tcp://${VPN_SERVER_ADDR}:${VPN_SERVER_PORT}
sed -i '/push "dhcp-option DNS .*"/d;/push "block-outside-dns"/a push "dhcp-option DNS 192.168.255.1"' /etc/openvpn/openvpn.conf

ovpn_initpki
