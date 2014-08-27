#!/bin/bash

sed -i "s/set \$AIPO_PORT_80_TCP_ADDR .*;\$/set \$AIPO_PORT_80_TCP_ADDR $AIPO_PORT_80_TCP_ADDR;/g" /etc/nginx/conf.d/nginx-reverseproxy-dockerfile.conf
sed -i "s/set \$AIPO_PORT_80_TCP_PORT .*;\$/set \$AIPO_PORT_80_TCP_PORT $AIPO_PORT_80_TCP_PORT;/g" /etc/nginx/conf.d/nginx-reverseproxy-dockerfile.conf

sed -i "s/set \$AIPO2_PORT_80_TCP_ADDR .*;\$/set \$AIPO2_PORT_80_TCP_ADDR $AIPO2_PORT_80_TCP_ADDR;/g" /etc/nginx/conf.d/nginx-reverseproxy-dockerfile.conf
sed -i "s/set \$AIPO2_PORT_80_TCP_PORT .*;\$/set \$AIPO2_PORT_80_TCP_PORT $AIPO2_PORT_80_TCP_PORT;/g" /etc/nginx/conf.d/nginx-reverseproxy-dockerfile.conf

nginx -g "daemon off;"
