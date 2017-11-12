FROM alpine:latest
MAINTAINER laouache
RUN apk --no-cache add coreutils curl git bash openrc
ADD ./install.sh /etc/local.d/10-install.start
RUN chmod +x /etc/local.d/10-install.start
RUN rc-update add local default
CMD ["/etc/local.d/10-install.start"]
