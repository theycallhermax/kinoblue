#!/bin/bash

set -ouex pipefail

dnf install --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terrs$releasever" terra-release
dnf copr enable -y sneexy/zen-browser

dnf install -y \
	zen \
	zed
