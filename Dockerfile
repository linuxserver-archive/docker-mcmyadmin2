FROM lsiobase/xenial
MAINTAINER Stian Larsen , sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
	git-core \
	libgdiplus \
	openjdk-8-jdk-headless \
	unzip \
	zip && \

# fetch and unpack mcmyadmin files
 curl -o \
 /tmp/MCMA2_glibc26_2.zip -L \
	http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip && \
 curl -o \
 /tmp/etc.zip -L \
	http://mcmyadmin.com/Downloads/etc.zip && \
 unzip -q /tmp/etc.zip -d /usr/local && \
 unzip -q /tmp/MCMA2_glibc26_2.zip -d /opt/mcmyadmin2 && \

# cleanup
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8080 25565
VOLUME /minecraft
