#!/bin/bash

set -ouex pipefail

dnf install -y --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" terra-release
dnf copr enable -y sneexy/zen-browser

dnf install -y \
	zen \
	zed
