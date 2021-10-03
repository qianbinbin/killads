#!/usr/bin/env sh

set -e

HEAD="# https://github.com/qianbinbin/killads

127.0.0.1 localhost
::1 localhost
"

url="https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-domains.txt"
suckers=$(curl -fsSL "$url")
suckers=$(echo "$suckers" | sed '/^#/d' | sed '/^[[:blank:]]*$/d')
suckers=$(echo "$suckers" | sed 's/^/127.0.0.1 /g')

echo "$HEAD"
echo "$suckers"
