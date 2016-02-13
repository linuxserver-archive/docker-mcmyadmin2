FROM linuxserver/baseimage
MAINTAINER Stian Larsen <lonixx@gmail.com>
ENV APTLIST="oracle-java8-installer oracle-java8-set-default libgdiplus wget zip unzip git-core"


#Applying stuff
RUN add-apt-repository ppa:webupd8team/java && \
apt-get update -q && \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
apt-get install \
$APTLIST -y && \
wget http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip -O /tmp/MCMA2_glibc26_2.zip && \
wget http://mcmyadmin.com/Downloads/etc.zip -O /tmp/etc.zip && \
unzip /tmp/etc.zip -d /usr/local && \
unzip /tmp/MCMA2_glibc26_2.zip -d /tmp && \
rm /tmp/etc.zip /tmp/MCMA2_glibc26_2.zip && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh


# Volums and Ports
VOLUME /minecraft
EXPOSE 8080
EXPOSE 25565
