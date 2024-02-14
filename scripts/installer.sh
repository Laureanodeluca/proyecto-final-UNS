#!/bin/bash
choice=$(zenity --list \
	--title "Instalación de paquetes - UNS" \
	--height=600 \
	--width=800 \
	--hide-column=1 \
	--column="package_name" --column="Nombre" --column="Descripción" \
	codeblocks CodeBlocks "IDE para programación en C" \
	lazarus Lazarus "IDE para programación en Pascal"\
	swi-prolog SWI-prolog "Intérprete para el lenguaje de programación Prolog")


echo "Seleccionado: ${choice}"

if [[ "$?" != "0" ]] ; then
	exit 1
else
	make ${choice} -f $(dirname $0)/packages/makefile
fi
