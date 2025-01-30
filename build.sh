#!/bin/bash

set -ouex pipefail

# install environment packages
dnf group install -y kde-desktop
dnf remove -y \
	dolphin \
	filelight \
	ark \
	konsole \
	kwrite \
	plasma-systemmonitor \
	kfind \
	kcharselect \
	kde-partitionmanager \
	firewall-config \
	kinfocenter \
	kdebugsettings \
	kde-gtk-config \
	plasma-discover \
	krfb \
	kjournald
dnf install -y \
	gnome-boxes gnome-connections gnome-software ptyxis gnome-text-editor nautilus baobab evince gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts gnome-tweaks gnome-disk-utility gnome-font-viewer gnome-logs gnome-maps gnome-remote-desktop gnome-system-monitor gnome-weather loupe simple-scan snapshot totem
