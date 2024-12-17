#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

fdroidcl repo add futo https://app.futo.org/fdroid/repo || true

fdroidcl update

APPS=(
  org.fdroid.fdroid # F-Droid
  app.organicmaps # Organic Maps
  com.vincent_falzon.discreetlauncher # Discreet Launhcer
  juloo.keyboard2 # Unexpected Keyboard
  ua.syt0r.kanji.fdroid # Kanji Dojo
  com.termux # Termux
  com.ichi2.anki # AnkiDroid
  org.schabi.newpipe # NewPipe
  ch.protonvpn.android # Proton VPN
  proton.android.pass.fdroid # Proton Pass
  com.amaze.filemanager # Amaze File Manager
  ch.blinkenlights.android.vanilla # Vanilla Music
  org.fossify.calculator
  org.fossify.camera
  org.fossify.phone
  org.fossify.contacts
  org.fossify.calendar
  org.fossify.gallery
  org.fossify.messages
  org.fossify.musicplayer
  org.fossify.filemanager
  org.fossify.voicerecorder
  org.telegram.messenger # Telegram
  ws.xsoh.etar # Etar
  com.beemdevelopment.aegis
  io.element.android.x # Element X
  im.vector.app # Element
  me.zhanghai.android.files # Material Files
  org.breezyweather # Breezy Weather
  org.futo.voiceinput # Futo Voice Input
  com.futo.platformplayer # GrayJay
  com.aurora.store # Aurora Store
  com.sweak.qralarm # QRAlarm
  org.koitharu.kotatsu # Kotatsu
  com.bnyro.translate # Translate You
  it.fast4x.rimusic # RiMusic
  website.leifs.delta.foss # Delta Icon Pack
  io.github.sds100.keymapper # Key Mapper
  io.github.yawnoc.strokeinput # Stroke Input Method
  com.kin.easynotes # Easy Notes
  org.proninyaroslav.libretorrent # LibreTorrent
  org.videolan.vlc # VLC
  org.kde.kdeconnect_tp # KDE Connect
)

fdroidcl install "${APPS[@]}"

echo "Done."
