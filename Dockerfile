FROM alpine:3.3
MAINTAINER Stephane Jourdan <fasten@fastmail.fm>
ENV REFRESHED_AT 2016-02-27
RUN apk add --update openssh-sftp-server dropbear \
    && rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear
RUN touch /var/log/lastlog
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["dropbear", "-RFEmwg", "-p", "22"]
