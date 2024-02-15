SHELL := /bin/bash
.DEFAULT:
	@yad \
	--text="<b>ERROR</b>: Paquete no encontrado. Contactar con un administrador." \
	--center \
	--width=350 \
	--text-align=center \
	--image=dialog-error \
	--borders=15


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
	PKG_NAME=$$(echo $$URL | grep -o "BlueJ-linux-[0-9]*\.deb");\
	$(call deb-install,$${URL},$${PKG_NAME},"BlueJ") 


define apt-install
	@pkexec -u $$USER sudo apt-get install $1 -y | zenity --progress --pulsate --no-cancel --auto-kill --auto-close --width=350 --text="Instalando paquete..." --title="Instalación de $1"; \
	if [[ "$$?" = "0" ]]; then \
		zenity --info --text="Instalación finalizada exitosamente."; \
	else \
		zenity --error --text="Ocurrió un error al instalar el paquete."; \
	fi
endef

define deb-install
	rm -f /tmp/$2*;\
	wget --progress=dot $1 -P /tmp 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de $2";\
	code=$$?;\
	if [[ $$code -eq 0 ]]; then \
		pkexec -u $$USER sudo dpkg -i /tmp/$2 2>&1 | yad --progress --pulsate --button=gtk-cancel:1 --auto-kill --auto-close --borders=15 --width=350 --title="Instalación de $2" --text="Instalando paquete...";\
		code=$$?;\
	fi; \
	if [[ $$code -eq 0 ]]; then \
		yad --title=Éxito --text="$3 Instalación finalizada." --with=350 --borders=15 --text-align=center --image=dialog-success;\
	else \
		yad --title=Error --text="Operación cancelada" --image=dialog-error borders=15 --text-align=center --width=350;\
	fi
endef