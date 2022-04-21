# suspend then hibernate

https://forum.endeavouros.com/t/how-to-configure-suspend-then-hibernate-properly/7670/9

# Display scaling?
https://wiki.archlinux.org/title/HiDPI#Boot_managers

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