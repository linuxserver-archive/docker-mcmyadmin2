[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: https://www.mcmyadmin.com/
[hub]: https://hub.docker.com/r/linuxserver/mcmyadmin2/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/mcmyadmin2
[![](https://images.microbadger.com/badges/version/linuxserver/mcmyadmin2.svg)](https://microbadger.com/images/linuxserver/mcmyadmin2 "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/mcmyadmin2.svg)](http://microbadger.com/images/linuxserver/mcmyadmin2 "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/mcmyadmin2.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/mcmyadmin2.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io/linuxserver-mcmyadmin2)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io/job/linuxserver-mcmyadmin2/)

[McMyAdmin][appurl] combines minecraft with a web control panel and admin console so can take a little while to start up.

[![mcmyadmin](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/mcmyadmin-banner.png)][appurl]

## Usage

```
 docker create --name=mcmyadmin \
 -v <path to data>:/minecraft \
 -e PGID=<gid> -e PUID=<uid> \
 -p 8080:8080 -p 25565:25565 \
 linuxserver/mcmyadmin2

```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`



* `-p 8080:8080` - Mcmyadmin webui port. 
* `-p 25565:25565` -  Minecraft game server port.
* `-v <path to data>:/minecraft` - The location to store all your permanent files server jars\maps\configs and more.
* `-e PGID` numeric GroupID - see below for explanation
* `-e PUID` numeric UserID - see below for explanation

It is based on ubuntu xenial with s6 overlay, for shell access whilst the container is running do `docker exec -it mcmyadmin /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

**Minimum of 2GB of ram required for this container to work properly.**

After starting the container, log into the Web UI as the `admin` user with the password `password` and change the password.
You should also consider serving the admin UI over https.

## Info

* Shell access whilst the container is running: `docker exec -it mcmyadmin /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f mcmyadmin`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' mcmyadmin`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/mcmyadmin2`

## Versions

+ **03.03.2017:** Rebase to ubuntu xenial.
+ **13.02.2016:** Switched to Java 8
+ **14.10.2104:** Removed Support for spigotmc
+ **01.07.2015:** Fixed docs
+ **26.06.2015:** Updated Docs and finalized design.
