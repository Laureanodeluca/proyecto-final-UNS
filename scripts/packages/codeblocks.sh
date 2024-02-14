##!/usr/bin/pkexec /bin/bash

pkexec apt-get install codeblocks -y | zenity --progress --pulsate --no-cancel --auto-kill --auto-close

if [ "$?" = "0" ]; then
	zenity --info \
		--text="Instalación finalizada"
fi;
