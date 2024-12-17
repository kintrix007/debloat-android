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
  com.google.android.calendar # Google Calendar
  com.android.chrome          # Google Chrome
  com.coloros.alarmclock      # Realme Clock
  com.coloros.calculator      # Realme Calculator
  com.coloros.compass2        # Realme Compass
  com.coloros.filemanager     # Realme File Manager
  com.coloros.gamespaceui     # Realme GameSpace
  com.coloros.phonemanager
  com.coloros.providers.downloads.ui # Realme Download UI
  com.coloros.soundrecorder          # Realme Sound Recorder
  com.coloros.systemclone
  com.coloros.video
  com.coloros.weather2                      # Realme Weather
  com.google.android.apps.docs              # Google Drive
  com.google.android.apps.googleassistant   # Google Assistant
  com.google.android.apps.magazines         # Google News
  com.google.android.apps.nbu.files         # Google Files
  com.google.android.apps.photos            # Google Photos
  com.coloros.gallery3d                     # Realme Photos
  com.google.android.apps.podcasts          # Google Podcasts
  com.google.android.apps.subscriptions.red # Google One
  com.google.android.apps.tachyon           # Google Duo
  com.google.android.apps.walletnfcrel      # Google Pay
  com.google.android.apps.youtube.music     # Youtube Music
  com.google.android.keep                   # Google Keep
  com.google.android.youtube
  com.heytap.music          # Realme Music
  com.realme.movieshot      # ???
  com.realme.wellbeing      # Realme Digital Wellbeing
  com.google.android.videos # Google Videos
  # com.google.mainline.telemetry # ???
  # com.google.android.gms.location.history # ???
  com.coloros.backuprestore    # Realme Clone Phone
  com.coloros.onekeylockscreen # Realme Lock Screen

  com.coloros.uxdesign # It can break things it seems?
)

DISABLE_PACKAGES=(
  com.google.android.dialer         # Google Phone
  com.google.android.contacts       # Google Contacts
  com.google.android.apps.messaging # Google Messages
  # com.coloros.deepthinker
  # com.coloros.safecenter
  com.coloros.weather.service
  com.oppo.camera                         # Camera
  com.google.android.googlequicksearchbox # Google
  # com.oppo.quicksearchbox
  com.google.mainline.telemetry           # ???
  com.google.android.gms.location.history # ???
  com.google.ar.lens                      # Google Lens
  com.android.vending                     # Google Play
  com.google.android.inputmethod.latin    # Gboard
  com.heytap.pictorial                    # Lock Screen Magazine
  com.google.android.tts                  # Speech Recognition & Synthesis
  com.google.android.projection.gearhead  # Android Auto
)

# com.android.phone # Do not disable!
# com.android.providers.contacts # Do not disable!

adb devices

for package in "${NUKE_PACKAGES[@]}"; do
  echo "Nuking $package..."
  adb shell pm uninstall --user 0 "$package" || true
done

for package in "${UNINSTALL_PACKAGES[@]}"; do
  echo "Uninstalling $package..."
  adb shell pm uninstall -k --user 0 "$package" || true
done

for package in "${DISABLE_PACKAGES[@]}"; do
  echo "Disabling $package..."
  adb shell pm disable-user --user 0 "$package" || true
done
