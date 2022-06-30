ARG BUILD_ARCH
FROM homeassistant/${BUILD_ARCH}-base:latest

#ARG BUILD_ARCH
#ARG TAILSCALE_VERSION="1.12.1"

ENV LANG C.UTF-8
# Install iptables dependency
RUN apk add -U iptables

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

#Run this entry point for debugging
#ENTRYPOINT ["tail", "-f", "/dev/null"]

CMD [ "/run.sh" ]