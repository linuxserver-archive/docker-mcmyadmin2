#!/bin/bash

echo "
	**********************************************************
	Updateing Sybolic links, This wil happen every boot.
	**********************************************************
	"
rm -f /minecraft/Minecraft/spigot.jar;  ln -s /minecraft/Minecraft/spigot-$REV.jar /minecraft/Minecraft/spigot.jar
rm -f /minecraft/Minecraft/craftbukkit.jar;  ln -s /minecraft/Minecraft/craftbukkit-$REV.jar /minecraft/Minecraft/craftbukkit.jar