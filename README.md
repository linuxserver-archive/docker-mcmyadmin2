# linuxserver/mcmyadmin

##Description:
This Continer is [Minecraft](https://minecraft.net/)+[McMyAdmin](https://www.mcmyadmin.com/)+[Spigotmc](http://www.spigotmc.org/) This contianer combines all of these things Autocompiles and autoinstalls stuff, so all you have to do is be patient while it works. 


####[Minecraft](https://minecraft.net/)
Minecraft is a game about breaking and placing blocks. At first, people built structures to protect against nocturnal monsters, but as the game grew players worked together to create wonderful, imaginative things.

####[McMyAdmin](https://www.mcmyadmin.com/)
is the leading web control panel and administration console for Minecraft servers, trusted by over 75000 server admins and more than 35 different service providers.

####[Spigotmc](http://www.spigotmc.org/)
Simply put, Spigot is it. Spigot is that "special sauce" used by many of the world's top Minecraft servers to ensure that they can cope with their huge player base and ensure the satisfaction of their players.


##Ports and mappings:

**8080** Maps to the mcmyadmin webui
**25565** Maps to Minecraft gameserver
**/minecraft** Will store all your minecraft related files
**PUID** What UID it will run under.
**PGID** What GID it wil run under.
**REV** *Optional* if you want a spesific minecraft version. 


## Sample create command:

*docker create --name=<name> -e PUID=<UID> -e PGID <GID> -p 8080:8080 -p 25565:25565 -v </path/to/minecraft>:/minecraft linuxserver/mcmyadmin*