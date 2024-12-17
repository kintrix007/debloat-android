#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

adb shell cmd package set-home-activity "com.vincent_falzon.discreetlauncher/.ActivityMain"
