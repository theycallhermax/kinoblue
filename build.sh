#!/bin/bash

set -ouex pipefail

# install repos
dnf install -y "dnf5-command(copr)"
dnf install -y --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" terra-release
dnf -y copr enable sneexy/zen-browser

# install environment packages 
dnf install -y \
	plasma-desktop

# install user packages
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub \
	app.zen_browser.zen \
	dev.zed.Zed
