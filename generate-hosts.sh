#!/usr/bin/env sh

set -e

HEAD=$(
  cat <<-END
# https://github.com/qianbinbin/killads

127.0.0.1 localhost
::1 localhost
END
)

suckers=$(curl -fsSL "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-domains.txt")
printf "%s\n\n" "$HEAD"
printf "%s\n" "$suckers" | sed '/^#/d; /^[[:blank:]]*$/d; s/^/127.0.0.1 /g'
