FROM ghcr.io/ublue-os/base-main:41

COPY build.sh /tmp/build.sh
COPY scripts /tmp/scripts

RUN for script in /tmp/scripts/*; do bash $script; done

RUN mkdir -p /var/lib/alternatives && \
	/tmp/build.sh && \
	ostree container commit
