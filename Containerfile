FROM quay.io/fedora/fedora-bootc:41

COPY build.sh /tmp/build.sh

COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os-udev-rules /
COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os/update-services /

RUN rm -rf dotfiles/.git && mkdir -p /usr/etc/skel
ADD dotfiles /usr/etc/skel

RUN dnf install -y glib2
ADD overrides /usr/share/glib-2.0/schemas/
RUN glib-compile-schemas /usr/share/glib-2.0/schemas

RUN mkdir -p /var/lib/alternatives && \
	/tmp/build.sh && \
	ostree container commit
