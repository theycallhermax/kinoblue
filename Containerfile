FROM ghcr.io/ublue-os/base-main:41

COPY build.sh /tmp/build.sh

COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os-udev-rules /
COPY --from=ghcr.io/ublue-os/config:latest /rpms/ublue-os-update-services.noarch.rpm /
RUN rpm -ivh /ublue-os-update-services.noarch.rpm

RUN for script in dotfiles/*; do bash $script; done

RUN rm -rf dotfiles/.git && mkdir -p /usr/etc/skel
ADD dotfiles /usr/etc/skel

RUN dnf install -y glib2
ADD overrides /usr/share/glib-2.0/schemas/
RUN glib-compile-schemas /usr/share/glib-2.0/schemas

RUN mkdir -p /var/lib/alternatives && \
	/tmp/build.sh && \
	ostree container commit
