#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

fdroidcl repo add futo https://app.futo.org/fdroid/repo || true
# fdroidcl repo add izzy https://apt.izzysoft.de/fdroid/repo || true

fdroidcl update

ESSENTIALS=(
  org.fdroid.fdroid                   # F-Droid
  com.aurora.store                    # Aurora Store
  com.vincent_falzon.discreetlauncher # Discreet Launhcer
  juloo.keyboard2                     # Unexpected Keyboard
  org.fossify.calculator
  org.fossify.calendar
  org.fossify.camera
  org.fossify.clock
  org.fossify.contacts
  org.fossify.filemanager
  org.fossify.gallery
  org.fossify.home # Fossify Launcher
  org.fossify.messages
  org.fossify.musicplayer
  org.fossify.notes
  org.fossify.phone
  org.fossify.voicerecorder
)

APPS=(
  app.organicmaps                  # Organic Maps
  ch.blinkenlights.android.vanilla # Vanilla Music
  ch.protonvpn.android             # Proton VPN
  ch.rmy.android.statusbar_tacho   # Status Bar Speedometer
  com.amaze.filemanager            # Amaze File Manager
  com.atharok.barcodescanner       # Barcode Scanner
  com.beemdevelopment.aegis        # Aegis Authenticator
  com.bnyro.translate              # Translate You
  com.futo.platformplayer          # GrayJay
  com.ichi2.anki                   # AnkiDroid
  com.kin.easynotes                # Easy Notes
  com.sweak.qralarm                # QRAlarm
  com.termux                       # Termux
  de.grobox.liberario              # Transportr
  im.vector.app                    # Element
  io.element.android.x             # Element X
  io.github.sds100.keymapper       # Key Mapper
  io.github.yawnoc.strokeinput     # Stroke Input Method
  io.heckel.ntfy                   # Ntfy
  it.fast4x.rimusic                # RiMusic
  me.zhanghai.android.files        # Material Files
  org.breezyweather                # Breezy Weather
  org.futo.voiceinput              # Futo Voice Input
  org.kde.kdeconnect_tp            # KDE Connect
  org.koitharu.kotatsu             # Kotatsu
  org.proninyaroslav.libretorrent  # LibreTorrent
  org.schabi.newpipe               # NewPipe
  org.telegram.messenger           # Telegram
  org.videolan.vlc                 # VLC
  proton.android.pass.fdroid       # Proton Pass
  ua.syt0r.kanji.fdroid            # Kanji Dojo
  website.leifs.delta.foss         # Delta Icon Pack
  ws.xsoh.etar                     # Etar

  # com.gitlab.mudlej.MjPdfReader    # MJ PDF - Only on Izzy
)

echo "Installing essential apps..."
fdroidcl install "${ESSENTIALS[@]}"
echo "Done."

echo "Installing other apps..."
fdroidcl install "${APPS[@]}"
echo "Done."
