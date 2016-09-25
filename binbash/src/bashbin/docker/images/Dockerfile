FROM alpine

MAINTAINER Doyle Fermi <doylefermi@gmail.com>
RUN apk add --update bash
RUN apk add --update curl 
RUN apk add --update bc
RUN apk add --update bash
RUN rm -rf /var/cache/apk/*
RUN rm -rf /bin/dd /bin/mount /bin/mountpoint /bin/pwd /bin/rm /bin/rmdir /bin/uname /bin/sleep
WORKDIR /tmp
