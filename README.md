![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/mcmyadmin

This Continer is [Minecraft](https://minecraft.net/)+[McMyAdmin](https://www.mcmyadmin.com/)+[Spigotmc](http://www.spigotmc.org/) This contianer combines all of these things Autocompiles and autoinstalls stuff, so all you have to do is be patient while it works. 


####[Minecraft](https://minecraft.net/)
Minecraft is a game about breaking and placing blocks. At first, people built structures to protect against nocturnal monsters, but as the game grew players worked together to create wonderful, imaginative things.

####[McMyAdmin](https://www.mcmyadmin.com/)
is the leading web control panel and administration console for Minecraft servers, trusted by over 75000 server admins and more than 35 different service providers.

####[Spigotmc](http://www.spigotmc.org/)
Simply put, Spigot is it. Spigot is that "special sauce" used by many of the world's top Minecraft servers to ensure that they can cope with their huge player base and ensure the satisfaction of their players.

## Usage

```
docker create --name=mcmyadmin -v /etc/localtime:/etc/localtime:ro -v <path to data>:/minecraft -e PGID=<gid> -e PUID=<uid>  -p 1234:1234 linuxserver/mcmyadmin
```

**Parameters**

* `-p 8080` - for Mcmyadmin webui
* `-p 25565` - for the minecraft game server
* `-v /etc/localhost` for timesync - *optional*
* `-v /minecraft` - The location to store all your permanent files server jars\maps\configs and more. 
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation
* `-e REV` specifiy the version you want to run. 


It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it quassel-core /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Notes

* You can access McMyAdmin on your server's port 8080 e.g. http://<ip>:8080. Default password is "password" and should be changed.
* Vanilla Minecraft, Spigot MC and CraftBukkit Comes Preinstalled and can be selected from the server dropdown, inside McMyAdmin
* First boot Can take a long while, as the Craftbukkit and Spigot Mc, binarys will have to be compiled (This is also true when you swap versions)
* Minimum of 2GB of ram required for this container to work properly.


## Updates

* Upgrade to the latest version simply `docker restart mcmyadmin`.
* To monitor the logs of the container in realtime `docker logs -f mcmyadmin`.


**Credits**

* lonix <lonixx@gmail.com>


**Versions**


* 26.06.2015: Updated Docs and finalized design.