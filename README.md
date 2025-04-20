# suspend then hibernate

https://forum.endeavouros.com/t/how-to-configure-suspend-then-hibernate-properly/7670/9

# Display scaling?

https://wiki.archlinux.org/title/HiDPI#Boot_managers

Currently using 125%. If you use different display scaling values on primary and secondary monitor, apps get blurry. Apps also get blurry if they are running in xwayland and not a native wayland window

# electron wayland support

some electron apps require manual setting of flags in the electron-flags.conf. This could depend on the version of electron app uses and also if it is bundled with the package or uses AUR version.

https://wiki.archlinux.org/title/wayland#Command_line_flags

# add an env variable to a launch command in a .desktop file

example for steam to fix display scaling

`/usr/bin/env GDK_SCALE=2 /usr/bin/steam-runtime %U`

# Fingerprint on Framework

Install some packages needed for fingerprint

`sudo yay -S fprintd libfprintd`

Gnome / GDM works out of the box however for other configuration look to `/etc/pam.d/...`

https://wiki.archlinux.org/title/fprint#Configuration

# tools/fprint-clear-storage-0.0.1.zip

This tool helps to reset the fingerprint sensor. Since when you distro hop or come from another linux distro it messes with enrollment. Extract and run

`sudo ./fprint-clear-storage-0.0.1-x86_64.AppImage`

This clears existing fingerprints

Source: https://community.frame.work/t/fingerprint-scanner-compatibility-with-linux-ubuntu-fedora-etc/1501/214

# launch applications in wayland mode

Sometimes display scaling is broken with certain apps when they run in XWayland. Add flags in .config for wayland launching to force compatibility.

Affected apps:

- brave
- vscode
- anything electron based

# mimeapps.list

configure here for default apps for different mime types. Specifically changes inode/directory to be opened by gnome nautilus so xdg-open doesn't force open vscode

# .bashrc

added some useful macros

`lid-stop`: forces ignoring of lid close: when lid is closed display stays on and does not force sleep

`school`: `cd` the directory `~/Documents/school/{currentYear}-{currentYear+1}/{Fall or Winter}` automatically based on the current date. Useful to hope right into my school dir

`sp`: `cd` the directory `~/Documents/sideprojects/{currentYear}` to quickly get into sideproject folder for this year

`o`: runs `xdg-open`, useful for opening files or directory in their default apps. Usually use to get into a GUI file browser like nautilus

# stepmania stuff

installed some packages from old git repos to get dancepad support for old ps3 pad. Created a custom launch script and desktop file to launch the game from with starts the pad reading daemon first then launches the game.

# enable tap to click globally on gdm

To make tap to click work on the lockscreen use this command

`sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'`

It enables tap to click for gdm user which is who you are before you login in gnome

# migrate from GRUB to systemd-boot

EOS bundles GRUB by default. After the GRUB issue fiasco breaking the bootloader; I switched to systemd-boot. Pretty easy to setup following this guide

https://forum.endeavouros.com/t/tutorial-convert-to-systemd-boot/13290

# restore gnome settings

Probably not safe to fully restore this on a new install but holds the keybindings and extension settings.


Important key bindings:

- Disabled the Super+P cycle windows shortcut in Mutter, so I could remap F9 key on Framework to something else (lid-stop)

- Ctrl + Shift + T Terminal

- Ctrl + Brightness down Set brightness minimum (backlight 0 / off not possible in gnome by default)

- Ctrl + Brightness up Set max brightness

- Ctrl + alt + delete open Gnome usage (like task manager)

To dump only user-altered keys:

  `dconf dump / > dump.dconf`

To restore:

  `dconf load / < dump.dconf`

# get .local addresses to work

source: https://wiki.archlinux.org/title/avahi

Install nss-mdns

Add to /etc/nsswitch

`hosts: mymachines mdns_minimal [NOTFOUND=return] resolve[!UNAVAIL=return] files myhostname dns`

# kitty terminal emulator

https://sw.kovidgoyal.net/kitty/

# neovim scrollback kitty

https://github.com/mikesmithgh/kitty-scrollback.nvim


# minimal alternative to tmux, supporting native scrollback

https://github.com/austinjones/tab-rs


# read book on kindle

https://aur.archlinux.org/packages/gourou#comment-906576
