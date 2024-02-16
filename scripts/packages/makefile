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
	$(call apt-install,codeblocks, Codeblocks)

.PHONY: lazarus
lazarus:
	$(call apt-install,lazarus, Lazarus)

.PHONY: swi-prolog
swi-prolog: 
	$(call apt-install,swi-prolog)

.PHONY: bluej
bluej:
	@URL=$$(curl -s https://www.bluej.org/ | grep -o "https://www\.bluej\.org/download/files/BlueJ-linux-[0-9]*\.deb"); \
	PKG_NAME=$$(echo $$URL | grep -o "BlueJ-linux-[0-9]*\.deb");\
	$(call deb-install,$${URL},$${PKG_NAME},BlueJ) 

.PHONY: eclipse
eclipse:
	@PACKAGE_NAME="eclipse-inst-jre-linux64.tar.gz";\
	BASE_URL="https://eclipse.c3sl.ufpr.br/oomph/epp/";\
	LATEST_RELEASE_DATE=$$(curl -s "$$BASE_URL" | grep -Eo "[0-9]{1,4}-[0-9]{1,2}/" | tail -n 1 | grep -Eo "[0-9]{1,4}-[0-9]{1,2}");\
	RELEASE=$$(curl -s "$${BASE_URL}/$${LATEST_RELEASE_DATE}/" | grep -o "M[0-9]" | tail -n 1);\
	URL=$${BASE_URL}$${LATEST_RELEASE_DATE}/$${RELEASE}/$${PACKAGE_NAME};\
	INSTALLER_FILENAME="eclipse-installer/eclipse-inst";\
	$(call tarball-download,$${URL},$${PACKAGE_NAME},$${INSTALLER_FILENAME},Eclipse)

.PHONY: staruml
staruml:
	@URL=https://staruml.io/$$(curl -s https://staruml.io/download/ | grep -o "api/download/releases-v6/StarUML_[0-9]*\.[0-9]*\.[0-9]*_amd64\.deb" | head -n 1);\
	PKG_NAME=$$(echo $$URL | grep -o "StarUML_[0-9]*\.[0-9]*\.[0-9]*_amd64\.deb");\
	$(call deb-install,$${URL},$${PKG_NAME},StarUML)

.PHONY: logisim
logisim:
	$(call apt-install,logisim,Logisim)

.PHONY: postgresql
postgresql:
	$(call apt-install,postgresql,PostgreSQL)

.PHONY: kotlin
kotlin:
	$(call apt-install,kotlin,Kotlin)

.PHONY: android-studio
android-studio:
	URL=$$(curl -s https://developer.android.com/studio?hl=es-419 | grep -o "https://redirector\.gvt1\.com/edgedl/android/studio/ide-zips/[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/android-studio-[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*-linux.tar.gz");\
	PACKAGE_NAME=$$(echo $${URL} | grep -o android-studio-[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*-linux.tar.gz);\
	echo "URL: $$URL";\
	wget --progress=dot $${URL} -P $${HOME} 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de Android Studio";\
	tar -xvzf /$${HOME}/$${PACKAGE_NAME} -C $${HOME} | yad --progress --pulsate --auto-kill --auto-close --borders=15 --no-buttons --text="Esperando a que finalice la instalación..." --title="Instalación de Android Studio";\
	eval $${HOME}/android-studio/bin/studio.sh


define apt-install
	@pkexec -u $$USER sudo apt-get install $1 -y | yad --progress --pulsate --button=gtk-cancel:1 --auto-kill --auto-close --borders=15 --width=350 --text="Instalando paquete..." --title="Instalación de $1"; \
	if [[ $$? -eq 0 ]]; then \
		yad --title="Éxito" --text-align=center --width=350 --borders=15 --image=dialog-success --text="$2 instalado correctamente."; \
	else \
		yad --title="Error" --text-align=center --width=350 --borders=15 --image=dialog-error --text="Operación cancelada."; \
	fi
endef

define deb-install
	echo /tmp/$2;\
	rm -f /tmp/$2*;\
	wget --progress=dot $1 -P /tmp 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de $2";\
	code=$$?;\
	if [[ $$code -eq 0 ]]; then \
		pkexec -u $$USER sudo dpkg -i /tmp/$2 2>&1 | yad --progress --pulsate --button=gtk-cancel:1 --auto-kill --auto-close --borders=15 --width=350 --title="Instalación de $2" --text="Instalando paquete...";\
		code=$$?;\
	fi; \
	if [[ $$code -eq 0 ]]; then \
		yad --title=Éxito --text="$3 se instaló correctamente." --with=350 --borders=15 --text-align=center --image=dialog-success;\
	else \
		yad --title=Error --text="Operación cancelada" --image=dialog-error borders=15 --text-align=center --width=350;\
	fi
endef

define tarball-download
	wget --progress=dot $1 -P /tmp 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de $4";\
	EXEC="tar -xvzf /tmp/$2 -C /tmp; /tmp/$3";\
	eval $$EXEC | yad --progress --pulsate --auto-kill --auto-close --borders=15 --no-buttons --text="Esperando a que finalice la instalación..." --title="Instalación de $4"
endef