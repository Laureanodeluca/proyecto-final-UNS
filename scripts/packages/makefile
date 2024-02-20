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
	@TARBALL_NAME="eclipse-inst-jre-linux64.tar.gz";\
	BASE_URL="https://eclipse.c3sl.ufpr.br/oomph/epp/";\
	LATEST_RELEASE_DATE=$$(curl -s "$$BASE_URL" | grep -Eo "[0-9]{1,4}-[0-9]{1,2}/" | tail -n 1 | grep -Eo "[0-9]{1,4}-[0-9]{1,2}");\
	RELEASE=$$(curl -s "$${BASE_URL}/$${LATEST_RELEASE_DATE}/" | grep -o "M[0-9]" | tail -n 1);\
	URL=$${BASE_URL}$${LATEST_RELEASE_DATE}/$${RELEASE}/$${TARBALL_NAME};\
	INSTALLER_FILENAME="eclipse-installer/eclipse-inst";\
	$(call tarball-download,$${URL},$${TARBALL_NAME},Eclipse);\
	$(call generic-install,$${INSTALLER_FILENAME},Eclipse)

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

.PHONY: alloy
alloy:
	URL=$$(curl -L https://api.github.com/repos/AlloyTools/org.alloytools.alloy/releases/latest | grep "browser_download_url.*jar"| cut -d : -f 2,3 | tr -d \");\
	mkdir ~/alloy/;\
	wget $${URL} -P ~ -O ~/alloy/alloy.jar 2>&1 | grep --line-buffered -Eo "[0-9]{1,2}%" | yad --progress --pulsate --auto-kill --auto-close --borders=15 --no-buttons --text="Esperando a que finalice la instalación..." --title="Instalación de Alloy";\
	chmod u+x ~/alloy/alloy.jar;\
	pkexec ln -s ~/alloy/alloy.jar /usr/bin/alloy

.PHONY: android-studio
android-studio:
	URL=$$(curl -s https://developer.android.com/studio?hl=es-419 | grep -o "https://redirector\.gvt1\.com/edgedl/android/studio/ide-zips/[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/android-studio-[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*-linux.tar.gz");\
	TARBALL_NAME=$$(echo $${URL} | grep -o android-studio-[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*-linux.tar.gz);\
	INSTALLER=android-studio/bin/studio.sh;\
	$(call tarball-download,$${URL},$${TARBALL_NAME},"Android\ Studio");\
	$(call generic-install,$${INSTALLER},"Android\ Studio")

.PHONY: visual-studio-code
visual-studio-code:
	@URL=$$(curl -sL https://code.visualstudio.com/updates/ | grep -o "https://update\.code\.visualstudio\.com/[0-9]*\.[0-9]*\.[0-9]*/linux-deb-x64/stable");\
	$(call deb-install,$${URL},visual-studio-code.deb,"Visual\ Studio\ Code")

.PHONY: virtualbox
virtualbox:
	@$(call apt-install,virtualbox,VirtualBox);\

.PHONY: mysql
mysql:
	@$(call apt-install,mysql-server,MySQL);
	$(call apt-install,mysql-client,MySQL)

.PHONY: intellij
intellij: 
	@LATEST_VERSION=$$(curl -s https://blog.jetbrains.com/idea/category/releases/ | grep -Eo "[0-9]{4}\.[0-9]*\.[0-9]*" | head -n 1);\
	PACKAGE_NAME=ideaIC-$${LATEST_VERSION}.tar.gz;\
	URL=https://download-cdn.jetbrains.com/idea/ideaIC-$${LATEST_VERSION}.tar.gz;\
	wget --progress=dot $${URL} -P ~ 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de IntelliJ";\
	tar -xvzf ~/$${PACKAGE_NAME} -C ~ | yad --progress --pulsate --auto-kill --auto-close --borders=15 --no-buttons --text="Descomprimiendo IntelliJ..." --title="Instalación de IntelliJ";\
	rm ~/$${PACKAGE_NAME};\
	DIRECTORY=$$(ls ~ | grep -o "idea-IC-[0-9]*\.[0-9]*\.[0-9]*" | head -n 1);\
	eval ~/$${DIRECTORY}/bin/idea.sh

.PHONY: npm
npm:
	@$(call apt-install,npm,NPM)

.PHONY: projectlibre
projectlibre:
	@LATEST_VERSION=$$(curl -sL https://sourceforge.net/projects/projectlibre/files/ProjectLibre/ | grep -o "[0-9]*\.[0-9]*\.[0-9]+*" | head -n 1);\
	PACKAGE_NAME=projectlibre_$${LATEST_VERSION}-1.deb;\
	URL=https://sitsa.dl.sourceforge.net/project/projectlibre/ProjectLibre/$${LATEST_VERSION}/$${PACKAGE_NAME};\
	$(call deb-install,$${URL},$${PACKAGE_NAME},"ProjectLibre")

.PHONY: postman
postman:
	@TARBALL_NAME="postman.tar.gz";\
	$(call tarball-download,"https://dl.pstmn.io/download/latest/linux_64",$${TARBALL_NAME},Postman)

.PHONY: php
php:
	@$(call apt-install,php,PHP)

.PHONY: pmd
pmd:
	@URL=$$(curl -sL https://api.github.com/repos/pmd/pmd/releases/latest | grep "browser_download_url.*bin\.zip" | cut -d : -f 2,3 | tr -d \");\
	ZIPFILE_NAME=$$(echo $${URL} | cut -d '/' -f 10-);\
	LATEST_VERSION=$$(curl -s https://api.github.com/repos/pmd/pmd/releases/latest | grep "tag_name.*[0-9]*\.*[0-9]*\.[0-9]*" | cut -d "/" -f 2- | tr -d \" | tr -d ,);\
	INSTALL_FOLDER="$${HOME}/pmd-bin-$${LATEST_VERSION}/";\
	echo "FLD: $$INSTALL_FOLDER";\
	$(call zip-download,$${URL},$${ZIPFILE_NAME}, "PMD");\
	pkexec ln -s $${INSTALL_FOLDER}/bin/pmd /usr/bin/

.PHONY: jenkins
jenkins:
	@pkexec /bin/bash -c 'wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key;\
	echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null;\
	echo "# Actualizando repositorio";\
	pkexec apt update;\
	echo "10";\
	echo "# Instalando dependencias...";\
	pkexec apt install fontconfig openjdk-17-jre -y;\
	echo "50";\
	echo "# Instalando Jenkins...";\
	pkexec apt-get install jenkins -y;\
	echo "100"' | zenity --progress --pulsate --no-cancel --auto-close --width=350 --text="Instalando paquete..." --title="Instalación de Jenkins"



# =============== Tipos de instalación genéricos ===============
# Para la mayoría de los paquetes, que siguen un patrón marcado de instalación
# 
# apt-install: Cuando la instalación se hace via el comando apt install [PAQUETE]
# 	$1: Nombre del paquete APT.
#	$2: Nomre del programa.
#
# deb-install: Cuando la instalación se hace mediante un archivo de instalación .deb
# 	$1: URL de descarga.
# 	$2: Nombre del paquete (nombre del archivo .deb).
# 	$3: Nombre del programa
#
# generic-install: Cuando la instalación se hace con un script de instalación
#	$1: URL de descarga		
#	$2: Nombre del archivo de instalación (partiendo desde $HOME)
#	$3: Nombre del programa.
#
# tarball-download: Descarga y descomprime un archivo .tar.gz.
# 	$1: URL de descarga.
# 	$2: Nombre del tarball (.tar.gz).
# 	$3: Nombre del programa.
#
# zip-download: Descarga y descomprime un archivo .zip.
#	$1: URL de descarga.
#	$2: Nombre del archivo .zip.
#	$3: Nombre del programa.

define apt-install
	pkexec apt-get install $1 -y | zenity --progress --pulsate --no-cancel --auto-close --width=350 --text="Instalando paquete..." --title="Instalación de $1"; \
endef

define deb-install
	echo /tmp/$2;\
	rm -f /tmp/$2*;\
	wget --progress=dot $1 -P /tmp -O /tmp/$2 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de $2";\
	code=$$?;\
	if [[ $$code -eq 0 ]]; then \
		pkexec dpkg -i /tmp/$2 2>&1 | zenity --progress --pulsate --no-cancel --auto-kill --auto-close --width=350 --title="Instalación de $2" --text="Instalando paquete...";\
		code=$$?;\
	fi
endef

define generic-install
	echo "PATH: $${HOME}/$1";\
	eval $$HOME/$1 | zenity --progress --pulsate --auto-kill --auto-close --no-cancel --text="Esperando a que finalice la instalación..." --title="Instalación de $2"
endef

define tarball-download
	wget --progress=dot $1 -O $$HOME/$2 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | yad --progress --button=gtk-cancel:1 --auto-close --borders=15 --width=350 --text="Descargando paquete..." --title="Instalación de $3";\
	tar -xvzf $$HOME/$2 -C $$HOME | zenity --progress --pulsate --no-cancel --auto-kill --auto-close --width=350 --title "Instalación de $3" --text="Descomprimiendo $2...";\
	rm -f $$HOME/$2
endef

define zip-download
	wget $1 -O $${HOME}/$2 2>&1 | grep --line-buffered -Eo "[0-9]{1,2}%" | yad --progress --pulsate --auto-kill --auto-close --borders=15 --no-buttons --text="Esperando a que finalice la instalación..." --title="Instalación de Alloy";\
	unzip $$HOME/$2 -d $$HOME| zenity --progress --pulsate --no-cancel --auto-kill --auto-close --width=350 --title "Instalación de $3" --text="Descomprimiendo $2...";\
	rm -f $${HOME}/$2
endef