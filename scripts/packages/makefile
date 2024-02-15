.DEFAULT:
	@zenity --error --text="Paquete no encontrado. Contactar con un administrador."

.PHONY: codeblocks
codeblocks:
	$(call apt-install,codeblocks)

.PHONY: lazarus
lazarus:
	$(call apt-install,lazarus)

.PHONY: swi-prolog
swi-prolog: 
	$(call apt-install,swi-prolog)

.PHONY: bluej
bluej:
	@URL=$$(curl -s https://www.bluej.org/ | grep -o "https://www\.bluej\.org/download/files/BlueJ-linux-[0-9]*\.deb"); \
	$(call deb-install,$${URL}) 


define apt-install
	@pkexec apt-get install $1 -y | zenity --progress --pulsate --no-cancel --auto-kill --auto-close; \
		if [[ "$?" != "0" ]] ; then \
    			zenity --error --text="Ocurrió un error al instalar el paquete.";\
		else \
			zenity --info --text="Instalación finalizada exitosamente.";\
		fi
endef

define deb-install
	wget $1 --report-speed=bits -P /tmp 2>&1 | sed -u 's/.* \([0-9]\+%\)\ \+\([0-9.]\+.\) \(.*\)/\1\n# Descargando a: \2\/s, Tiempo restante: \3/' | zenity --progress --title="Downloading File..." 	
endef
