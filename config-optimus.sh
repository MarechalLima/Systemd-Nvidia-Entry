#!/bin/bash
if ! [ -d /opt/solus-prime-indicator/ ]; then ## checks if the directory exist
	mkdir /opt/solus-prime-indicator/ -p ## if it doesn't exist, here it's created
fi

if [[ `lsmod | grep nouveau` == "" ]]; then ## Nvidia
	if ! [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then
		cp /opt/solus-prime-indicator/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf -f
	fi
	if ! [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep '#'` == "" ]]; then
		sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf
	fi
	if [[ `cat /usr/lib/modprobe.d/optimus.conf | grep '#'` == "" ]]; then
		sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/optimus.conf
	fi
else
	if [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then ## Nouveau
		mv /etc/X11/xorg.conf.d/00-ldm.conf /opt/solus-prime-indicator/00-ldm.conf -f
	fi
	if [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep '#'` == "" ]]; then
		sed -i 's/blacklist/#blacklist/g' /usr/lib/modprobe.d/nvidia.conf
	fi

	if ! [[ `cat /usr/lib/modprobe.d/optimus.conf | grep '#'` == "" ]]; then
		sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/optimus.conf
	fi
fi