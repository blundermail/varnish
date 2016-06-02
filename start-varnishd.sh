#!/bin/bash
set -e

cat >/etc/varnish/default.vcl <<EOF
vcl 4.0;

backend default {
	.host = "$VARNISH_BACKEND_HOST";
	.port = "$VARNISH_BACKEND_PORT";
}
EOF

exec varnishd 				\
	-j unix,user=varnishd 		\
	-F 				\
	-f /etc/varnish/default.vcl 	\
	-s ${VARNISH_STORAGE_BACKEND} 	\
	-a 0.0.0.0:${VARNISH_PORT}
