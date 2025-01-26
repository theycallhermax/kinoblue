#!/bin/bash

set -ouex pipefail

dnf install -y --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" terra-release
dnf install -y "dnf5-command(copr)"
dnf -y copr enable sneexy/zen-browser

dnf install -y \
	zen-browser \
	zed
