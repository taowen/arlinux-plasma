#!/bin/sh
# Plasma's X11 shell uses the host display without starting a second WM.
set -eu
export XDG_MENU_PREFIX=plasma-
mkdir -p "$HOME/Desktop" "$HOME/Documents" "$HOME/Downloads" "$HOME/Pictures" "$HOME/.config"
# Android owns locking and power management.
if [ ! -f "$HOME/.config/kscreenlockerrc" ]; then
    printf '[Daemon]\nAutolock=false\nLockOnResume=false\n' > "$HOME/.config/kscreenlockerrc"
fi
if [ ! -f "$HOME/.config/kdeglobals" ]; then
    printf '[Icons]\nTheme=breeze\n[KDE]\nwidgetStyle=Breeze\n' > "$HOME/.config/kdeglobals"
fi
if [ ! -f "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc" ]; then
    cp /usr/lib/arlinux/guest/plasma-appletsrc "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
fi
# Wait for hosted input before Qt chooses its input method.
dbus-send --session --print-reply --dest=org.arlinux.HostedInput \
    /org/arlinux/HostedInput org.freedesktop.DBus.Peer.Ping >/dev/null
kbuildsycoca6 --noincremental > "$XDG_RUNTIME_DIR/plasma-cache.log" 2>&1
kded6 > "$XDG_RUNTIME_DIR/plasma-kded.log" 2>&1 &
/usr/lib/aarch64-linux-gnu/libexec/kactivitymanagerd > "$XDG_RUNTIME_DIR/plasma-activities.log" 2>&1 &
exec plasmashell --no-respawn
