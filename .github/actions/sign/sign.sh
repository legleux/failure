#!/usr/bin/env bash

set -eo pipefail

sign_dpkg() {
  echo "GOT GPG_KEYID: ${GPG_KEYID} "
  echo "GOT GPG_PASSPHRASE: $ {GPG_PASSPHRASE}"
  if [ -n "${GPG_KEYID}" ]; then
    dpkg-sig \
      -g "--no-tty --digest-algo 'sha512' --passphrase '${GPG_PASSPHRASE}' --pinentry-mode=loopback" \
            -k "${GPG_KEYID}" \
            --sign builder \
            $1
    fi
}
echo "Input was $1"
sign_dpkg $1
