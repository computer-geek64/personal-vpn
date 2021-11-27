#!/bin/bash
# init.sh

test "${VPN_SERVER_IP}" = "127.0.0.1" && VPN_SERVER_IP=$(curl -s http://ipecho.net/plain)
ovpn_genconfig -u tcp://${VPN_SERVER_IP}:${VPN_SERVER_PORT}
ovpn_initpki
