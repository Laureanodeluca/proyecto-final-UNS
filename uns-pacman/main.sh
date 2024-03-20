#!/bin/bash
VERSION=0.3
check_installation() {
	if [[ $? -eq 0 ]]; then 
		yad --title="Éxito" --text-align=center --width=350 --borders=15 --image=dialog-info --text="Operación finalizada correctamente.";
	else 
		yad --title="Error" --text-align=center --width=350 --borders=15 --image=dialog-error --button="Ok":0 --text="La operación finalizó inesperadamente.";
	fi;
}

export -f check_installation;

main_program() {
	source $(dirname $0)/updater.sh

	while [ $? -eq 0 ] 
	do
		choice=$(yad --list \
			--title "Instalación de paquetes - UNS" \
			--height=600 \
			--width=1200 \
			--borders=15 \
			--hide-column=1 \
			--column="package_name" --column="Nombre" --column="Descripción" --column="Año" --column="Materia/s" \
			--button="Seleccionar":0 \
			--button="Salir":1 \
			--print-column=1 \
			--grid-lines=vert \
			--header-tips \
			--separator="" \
			google-chrome "Google Chrome" "Navegador web de Google." "-" "-" \
			github-desktop "Github Desktop" "Aplicación de escritorio del sistema de control de versiones Github." "-" "-" \
			lazarus Lazarus "IDE para programación en Pascal." 1° "Resolución de Problemas y Algoritmos" \
			java "Java (JDK)" "JDK. Developer Kit del lenguaje de programación Java." "1°, 2°, 3°" "IPOO, Estructuras de Datos, Tecnología de la Programación, Bases de Datos" \
			bluej BlueJ "IDE para programación en Java. Orientado a principiantes." 1° "Introducción a la Programación Orientada a Objetos" \
			eclipse Eclipse "IDE para programación en Java." 2° "Estructuras de Datos, Tecnología de la Programación" \
			codeblocks Code::Blocks "IDE para programación en C." 2° "Organización de Computadoras" \
			staruml StarUML "Herramienta para creación de diagramas UML." 2° "Modelos de Software" \
			infostat Infostat "Herramienta para visualización de modelos estadísticos" 2° "Modelos Estadísticos para Ciencias de la Computación" \
			logisim Logisim "Herramienta para diagramado de circuitos." 3° "Arquitectura de Computadoras" \
			mysql MySQL "Administrador de bases de datos." 3° "Bases de Datos" \
			swi-prolog SWI-prolog "Intérprete para el lenguaje de programación Prolog." 3° "Lógica para Ciencias de la Computación" \
			alloy Alloy "Lenguaje para expresar estructuras de control y comportamiento en un sistema de software." 3° "Métodos Formales para Ingeniería de Software" \
			virtualbox VirtualBox "Gestor de máquinas virtuales." "3°, 5°" "Sistemas Operativos, Redes de Computadoras" \
			postgresql PostgreSQL "Sistema de gestión de bases de datos open source." 4° "Ingeniería de Aplicaciones Web" \
			kotlin Kotlin "Lenguaje de programación de alto nivel." 4° "Arquitectura y Diseño de Software" \
			android-studio "Android Studio" "IDE para programación en dispositivos Android." 4° "Arquitectura y Diseño de Software" \
			visual-studio-code "Visual Studio Code" "IDE para programación multilenguaje." 4° "Ingeniería de Aplicaciones Web" \
			intellij "IntelliJ IDEA" "IDE para programación en Java y Kotlin." 4° "Arquitectura y Diseño de Software" \
			npm "NPM" "Sistema de gestión de paquetes para NodeJS." 4° "Ingeniería de Aplicaciones Web" \
			projectlibre "ProjectLibre" "Sistema de gestión de proyectos." 4° "Proyectos de Sistemas de Software" \
			postman "Postman" "Gestor de endpoints de APIs." 4° "Ingeniería de Aplicaciones Web" \
			php "PHP" "Lenguaje de programación interpretado del lado del servidor." 4° "Ingeniería de Aplicaciones Web" \
			pmd "PMD" "Analizador de código multilenguaje." 4° "Verificación y Validación de Software" \
			jenkins "Jenkins" "Servidor de automatización de código abierto." 4° "Verificación y Validación de Software" );

		exval=$?;

		if [ $exval -eq 0 ]; then
			source $(dirname $0)/managers/check-installed.sh $choice
			is_installed=$?

			if [ $is_installed -eq 1 ]; then
				yad --title="${choice}" \
					--image="info" \
					--text="¿Desea instalar ${choice}?" \
					--window-icon="info" \
					--center \
					--borders=15 \
					--button="Instalar":0 \
					--button="Cancelar":2;
			else
				yad --title="${choice}" \
					--image="info" \
					--text="¿Desea desinstalar ${choice}?" \
					--window-icon="info" \
					--center \
					--borders=15 \
					--button="Desinstalar":1 \
					--button="Cancelar":2;
			fi


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
}
export -f main_program

case $1 in
	"--version"|"-v")
	echo "UNS-Pacman v$VERSION"
	;;
	*)
	main_program
	;;
esac