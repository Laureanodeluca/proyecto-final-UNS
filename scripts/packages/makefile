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

define apt-install
	@pkexec apt-get install $1 -y | zenity --progress --pulsate --no-cancel --auto-kill --auto-close; \
		if [[ "$?" != "0" ]] ; then \
    			zenity --error --text="Ocurrió un error al instalar el paquete.";\
		else \
			zenity --info --text="Instalación finalizada exitosamente.";\
		fi
endef
