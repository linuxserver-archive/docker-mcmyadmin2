#!/bin/bash

export HOME=/root

if [ ! -f "/minecraft/Minecraft/spigot-$REV.jar" ]; then
	echo "
	**********************************************************
	Building Spigot and craftbukkit this can Take a long time
	**********************************************************
	Go Grab a Coffee/Beer
	"
	cd /tmp && java -jar BuildTools.jar --rev $REV;
	cp -v /tmp/spigot-$REV.jar /minecraft/Minecraft/
	cp -v /tmp/craftbukkit-$REV.jar /minecraft/Minecraft/
	fi
	