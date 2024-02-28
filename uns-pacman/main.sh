#!/bin/bash

check_installation() {
	if [[ $? -eq 0 ]]; then 
		yad --title="Éxito" --text-align=center --width=350 --borders=15 --image=dialog-info --text="Operación finalizada correctamente.";
	else 
		yad --title="Error" --text-align=center --width=350 --borders=15 --image=dialog-error --button="Ok":0 --text="La operación finalizó inesperadamente.";
	fi;
}

export -f check_installation;

while [ $? -eq 0 ] 
do
	choice=$(yad --list \
		--title "Instalación de paquetes - UNS" \
		--height=600 \
		--width=800 \
		--borders=15 \
		--hide-column=1 \
		--column="package_name" --column="Nombre" --column="Descripción" \
		--button="Seleccionar":0 \
		--button="Salir":1 \
		--print-column=1 \
		--grid-lines=vert \
		--header-tips \
		--separator="" \
		codeblocks CodeBlocks "IDE para programación en C." \
		lazarus Lazarus "IDE para programación en Pascal."\
		swi-prolog SWI-prolog "Intérprete para el lenguaje de programación Prolog."\
		bluej BlueJ "IDE para programación en Java. Orientado a principiantes." \
		eclipse Eclipse "IDE para programación en Java."\
		staruml StarUML "Herramienta para creación de diagramas UML."\
		logisim Logisim "Herramienta para diagramado de circuitos."\
		postgresql PostgreSQL "Sistema de gestión de bases de datos open source."\
		kotlin Kotlin "Lenguaje de programación de alto nivel."\
		android-studio "Android Studio" "IDE para programación en dispositivos Android."\
		visual-studio-code "Visual Studio Code" "IDE para programación multilenguaje."\
		alloy Alloy "Lenguaje para expresar estructuras de control y comportamiento en un sistema de software."\
		mysql MySQL "Administrador de bases de datos."\
		virtualbox VirtualBox "Gestor de máquinas virtuales."\
		intellij "IntelliJ IDEA" "IDE para programación en Java y Kotlin."\
		npm "NPM" "Sistema de gestión de paquetes para NodeJS."\
		projectlibre "ProjectLibre" "Sistema de gestión de proyectos."\
		postman "Postman" "Gestor de endpoints de APIs."\
		php "PHP" "Lenguaje de programación interpretado del lado del servidor."\
		pmd "PMD" "Analizador de código multilenguaje."\
		jenkins "Jenkins" "Servidor de automatización de código abierto.");

	exval=$?;

	if [ $exval -eq 0 ]; then
		yad --title="${choice}" \
			--image="info" \
			--text="¿Desea instalar o desinstalar ${choice}?" \
			--window-icon="info" \
			--center \
			--borders=15 \
			--button="Instalar":0 \
			--button="Desinstalar":1 \
			--button="Cancelar":2

		option=$?
		if [ $option -eq 0 ]; then 
			make ${choice} -f $(dirname $0)/managers/installer;
			check_installation;
		else
			if [ $option -eq 1 ]; then 
				make ${choice} -f $(dirname $0)/managers/uninstaller
				check_installation;
			fi;
		fi;				
	else
		exit 1;
	fi;
done