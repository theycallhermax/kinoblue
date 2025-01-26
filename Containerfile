FROM quay.io/fedora/fedora-bootc:41

COPY build.sh /tmp/build.sh

RUN rm -rf dotfiles/.git && mkdir -p /usr/etc/skel
ADD dotfiles /usr/etc/skel

RUN mkdir -p /var/lib/alternatives && \
	/tmp/build.sh && \
	ostree container commit
#	bootc container lint
