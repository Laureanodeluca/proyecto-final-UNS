#!/bin/bash
choice=$(zenity --list \
	--title "Instalación de paquetes - UNS" \
	--height=600 \
	--width=800 \
	--hide-column=1 \
	--column="package_name" --column="Nombre" --column="Descripción" \
	codeblocks CodeBlocks "IDE para programación en C" \
	lazarus Lazarus "IDE para programación en Pascal")

make ${choice} -f packages/makefile 
