FROM lsiobase/alpine.python3:3.9

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS="2"

# Set python to use utf-8 rather than ascii.
ENV LANG C.UTF-8

# Add edge/testing repositories.
RUN printf "\
@edge http://nl.alpinelinux.org/alpine/edge/main\n\
@testing http://nl.alpinelinux.org/alpine/edge/testing\n\
@community http://nl.alpinelinux.org/alpine/edge/community\n\
" >> /etc/apk/repositories

# Copy local files.
COPY etc/ /etc
RUN chmod -v +x \
    /etc/cont-init.d/*  \
    /etc/services.d/*/run

# Ports and volumes.
EXPOSE 5050/tcp
VOLUME /config
