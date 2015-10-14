![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/mcmyadmin

This container is [Minecraft](https://minecraft.net/), [McMyAdmin](https://www.mcmyadmin.com/)all-in-one. It combines all of these applications into one container and consequently takes a little while to start up.


####[Minecraft](https://minecraft.net/)
Minecraft is a game about breaking and placing blocks. At first, people built structures to protect against nocturnal monsters, but as the game grew players worked together to create wonderful, imaginative things.

####[McMyAdmin](https://www.mcmyadmin.com/)
is the leading web control panel and administration console for Minecraft servers, trusted by over 75000 server admins and more than 35 different service providers.


## Usage

```
docker create --name=mcmyadmin -v /etc/localtime:/etc/localtime:ro -v <path to data>:/minecraft -e PGID=<gid> -e PUID=<uid>  -e REV=1.8.7 -p 8080:8080 -p 25565:25565 linuxserver/mcmyadmin:latest
```

For example:

```
docker create --name=mcmyadmin -v /appdata/minecraft:/minecraft -e PUID=1000 -e PGID=1000 -p 8080:8080 -p 25565:25565 linuxserver/mcmyadmin:latest
docker start mcmyadmin
```

**Parameters**

 The parameters are split into two halves, separated by a colon. For example with a port `-p external:internal` - what this shows is the port mapping from internal to external of the container. So `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` (e.g. `http://192.168.x.x:8080` would show you what's running INSIDE the container on port `80`).

* `-p 8080:8080` - Expose the Mcmyadmin webui on the host OS. Change the first number to use a different port on the host OS.
* `-p 25565:25565` -  Expose the minecraft game server on the host OS. Change the first number to use a different port on the host OS.
* `-v /etc/localtime` for timesync - *optional*
* `-v appdata/minecraft:/minecraft` - The location to store all your permanent files server jars\maps\configs and more.
* `-e PGID` numeric GroupID - see below for explanation
* `-e PUID` numeric UserID - see below for explanation

After starting the container, log into the Web UI as the `admin` user with the password `password` and change the password. You should also consider serving the admin UI over https. This container is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it mcmyadmin /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` are the *numeric* Linux group and user ids for the group/user you'd like your container to 'run as' to the host OS. Typically this is a user you've created, but could even be root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Notes

* If running multiple containers on one host, change the storage location and host OS ports to avoid conflicts.
* You can access McMyAdmin on your server's port 8080 e.g. http://<ip>:8080. Default password is "password" and should be changed.* Minimum of 2GB of ram required for this container to work properly.


## Updates

* Upgrade to the latest version simply `docker restart mcmyadmin`.
* To monitor the logs of the container in realtime `docker logs -f mcmyadmin`.


## Versions

+ **14.10.2104:** Removed Support for spigotmc
+ **01.07.2015:** Fixed docs
+ **26.06.2015:** Updated Docs and finalized design.