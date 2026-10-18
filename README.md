# ARLinux KDE Plasma

KDE Plasma 6.3 on Debian 13 (ARM64), using ARLinux's host display, input and audio.
Plasma's X11 desktop shell uses the host-provided Xwayland and stacking window
manager. No nested KWin, display manager or systemd session is started.
Android owns networking, power, screen locking and application lifecycle.

Desktop packages, Dolphin, Konsole and Kate are included in the offline ZIP.
First start performs local configuration and does not download packages.
OpenCode, Steam and Windows apps retain their normal on-demand installers.

构建与发布只遵循 [唯一构建与发布流程](https://github.com/taowen/arlinux-rootfs/blob/main/docs/BUILD.md)。软件包在 Linux/WSL 构建时准备。

GPL-3.0-or-later for this recipe. Debian and KDE packages retain their licenses.
