#!/usr/bin/env bash

set -eo pipefail

sign_dpkg() {
  if [ -n "${GPG_KEYID}" ]; then
    dpkg-sig \
      -g "--no-tty --digest-algo 'sha512' --passphrase '${GPG_PASSPHRASE}' --pinentry-mode=loopback" \
            -k "${GPG_KEYID}" \
            --sign builder \
            $1
    fi
}

sign_dpkg $1
