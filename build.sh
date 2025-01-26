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
dnf install -y \
	zen-browser \
	zed
