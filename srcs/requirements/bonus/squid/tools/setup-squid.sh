#!/bin/bash

if [ -f /run/squid.pid ]; then
	kill -9 `cat /run/squid.pid`
	rm -rf /run/squid.pid
fi

$@
