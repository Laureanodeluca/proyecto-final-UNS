#!/bin/bash
choice=$(yad --list \
	--title "Instalación de paquetes - UNS" \
	--height=600 \
	--width=800 \
	--borders=15 \
	--hide-column=1 \
	--column="package_name" --column="Nombre" --column="Descripción" \
	--print-column=1 \
	--separator=""\
	codeblocks CodeBlocks "IDE para programación en C." \
	lazarus Lazarus "IDE para programación en Pascal."\
	swi-prolog SWI-prolog "Intérprete para el lenguaje de programación Prolog."\
	bluej BlueJ "IDE para programación en Java. Orientado a principiantes." \
	eclipse Eclipse "IDE para programación en Java."\
	staruml StarUML "Herramienta para creación de diagramas UML."\
	logisim Logisim "Herramienta para diagramado de circuitos."\
	postgresql PostgreSQL "Sistema de gestión de bases de datos open source."\
	kotlin Kotlin "Lenguaje de programación de alto nivel."\
	android-studio "Android Studio" "IDE Para programación en dispositivos Android."\
	visual-studio-code "Visual Studio Code" "IDE Para programación multilenguaje."\
	alloy Alloy "Lenguaje para expresar estructuras de control y comportamiento en un sistema de software.")

if [ $? -eq 0 ]; then
	make ${choice} -f $(dirname $0)/packages/makefile
else
	exit 1
fi
