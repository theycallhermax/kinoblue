FROM ghcr.io/ublue-os/base-main:41

COPY build.sh /tmp/build.sh

RUN rm -rf dotfiles/.git && mkdir -p /usr/etc/skel
ADD dotfiles /usr/etc/skel

RUN dnf install -y glib2
ADD overrides /usr/share/glib-2.0/schemas/
RUN glib-compile-schemas /usr/share/glib-2.0/schemas

RUN mkdir -p /var/lib/alternatives && \
	/tmp/build.sh && \
	ostree container commit
#	bootc container lint
