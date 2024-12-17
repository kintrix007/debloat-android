#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

TMP_ROOT="$(mktemp -d)"
wget --directory-prefix "$TMP_ROOT" 'https://f-droid.org/F-Droid.apk'
adb install -r "$TMP_ROOT/F-Droid.apk"
rm -r "$TMP_ROOT"
