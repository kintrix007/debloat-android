#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

NUKE_PACKAGES=(
  com.facebook.appmanager
  com.facebook.katana
  com.facebook.services
  com.facebook.system
)

UNINSTALL_PACKAGES=(
  # com.google.android.apps.maps # Google Maps
  # com.coloros.floatassistant # ???
  # com.coloros.karaoke # ???
  com.google.android.calendar
  com.android.chrome
  com.coloros.alarmclock # Realme Clock
  com.coloros.calculator # Realme Calculator
  com.coloros.compass2 # Realme Compass
  com.coloros.filemanager # Realme File Manager
  com.coloros.gallery3d
  com.coloros.gamespaceui # Realme GameSpace
  com.coloros.phonemanager
  com.coloros.providers.downloads.ui
  com.coloros.soundrecorder # Realme Sound Recorder
  com.coloros.systemclone
  com.coloros.video
  com.coloros.weather.service
  com.coloros.weather2 # Realme Weather
  com.google.android.apps.docs # Google Drive
  com.google.android.apps.googleassistant
  com.google.android.apps.magazines # Google News
  com.google.android.apps.nbu.files # Google Files
  com.google.android.apps.photos # Google Photos
  com.google.android.apps.podcasts # Google Podcasts
  com.google.android.apps.subscriptions.red # Google One
  com.google.android.apps.tachyon # Google Duo
  com.google.android.apps.walletnfcrel # Google Pay
  com.google.android.apps.youtube.music # Youtube Music
  com.google.android.keep # Google Keep
  com.google.android.youtube
  com.heytap.music # Realme Music
  com.realme.movieshot # ???
  com.realme.wellbeing # Realme Digital Wellbeing
  com.google.android.videos # Google Videos
  # com.google.mainline.telemetry # ???
  # com.google.android.gms.location.history # ???
  com.google.android.inputmethod.latin
)

DISABLE_PACKAGES=(
  com.android.phone # ???
  com.google.android.dialer # Google Phone
  com.google.android.contacts # Google Contacts
  com.google.android.apps.messaging # Google Messages
  # com.coloros.deepthinker
  # com.coloros.safecenter
  com.oppo.camera
  com.google.android.googlequicksearchbox # Google
  com.oppo.quicksearchbox
  com.google.mainline.telemetry # ???
  com.google.android.gms.location.history # ???
  # com.google.ar.lens # Google Lens
  com.android.vending # Google Play
)

# com.android.providers.contacts # Do not disable!

adb devices

for package in "${NUKE_PACKAGES[@]}"; do
  echo "Nuking $package..."
  adb shell pm uninstall --user 0 "$package" || echo "Failed."
done

for package in "${UNINSTALL_PACKAGES[@]}"; do
  echo "Uninstalling $package..."
  adb shell pm uninstall -k --user 0 "$package" || echo "Failed."
done

for package in "${DISABLE_PACKAGES[@]}"; do
  echo "Disabling $package..."
  adb shell pm disable-user --user 0 "$package" || echo "Failed."
done

