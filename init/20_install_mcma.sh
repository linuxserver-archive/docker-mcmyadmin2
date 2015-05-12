#!/bin/bash

if [ ! -x /minecraft/MCMA2_Linux_x86_64 ]; 
	then 
	echo "
	**********************************************************
	Installing Mcmyadmin & Vanilla Minecraft,
	this will only take a few minutes
	**********************************************************
	"
	cp -v /tmp/MCMA2_Linux_x86_64 /minecraft/MCMA2_Linux_x86_64
	chmod +x /minecraft/MCMA2_Linux_x86_64
	cd /minecraft
	./MCMA2_Linux_x86_64 -setpass password -nonotice -configonly
fi
