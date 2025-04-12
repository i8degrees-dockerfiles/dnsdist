#!/bin/sh
#
# TODO(JEFF): Relocate this script to the 
# i8degrees-scripts organization's spot for
# automated DNS testing.
#

local_host=fs1.home
remote_host=github.com
local_dns="https://docker.fs1.home:433/dns-query"
remote_dns="https://1.1.1.1/dns-query"

echo "$local_dns $local_host"
echo
curl --doh-url "$local_dns" $local_host
echo "cert status"
echo
curl --doh-cert-status $local_dns docker.fs1.home

#curl ---doh-insecure $local_dns

echo "$remote_dns $remote_host"
echo
curl --doh-url "$remote_dns" $remote_host
echo "cert status"
echo
curl --doh-cert-status $remote_dns $remote_host
