#!/bin/bash

set -ouex pipefail

# install repos
dnf install -y "dnf5-command(copr)"
dnf install -y --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" terra-release
dnf -y copr enable sneexy/zen-browser

# install cli packages
dnf install -y \
	flatpak \
 	git

# install environment packages 
dnf install -y \
	plasma-desktop \
	dconf gnome-boxes gnome-connections gnome-settings-daemon gnome-software ptyxis gnome-text-editor nautilus polkit yelp ModemManager NetworkManager-adsl NetworkManager-openconnect-gnome NetworkManager-openvpn-gnome NetworkManager-ppp NetworkManager-pptp-gnome NetworkManager-ssh-gnome NetworkManager-vpnc-gnome NetworkManager-wwan PackageKit-command-not-found PackageKit-gtk3-module avahi baobab evince evince-djvu fprintd-pam glib-networking gnome-backgrounds gnome-bluetooth gnome-browser-connector gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-contacts gnome-tweaks gnome-disk-utility gnome-font-viewer gnome-logs gnome-maps gnome-remote-desktop gnome-session-xsession gnome-system-monitor gnome-user-share gnome-weather gvfs-afc gvfs-afp gvfs-archive gvfs-fuse gvfs-goa gvfs-gphoto2 gvfs-mtp gvfs-smb librsvg2 libsane-hpaio loupe mesa-dri-drivers mesa-libEGL rygel sane-backends-drivers-scanners simple-scan snapshot sushi systemd-oomd-defaults vlc tracker tracker-miners xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk xdg-user-dirs-gtk

# install icon theme
git clone --depth=1 https://github.com/theycallhermax/WhiteSur-icon-theme.git /tmp/WhiteSur-icon-theme
cd /tmp/WhiteSur-icon-theme
./install.sh -a
cd -
rm -rf /tmp/WhiteSur-icon-theme

# install user packages
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub \
	app.zen_browser.zen \
	dev.zed.Zed
