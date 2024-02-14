#!/bin/bash
choice=$(zenity --list \
	--title "Paquete" \
	--column="Nombre" --column="Descripción" \
	CodeBlocks "IDE para programación en C" \
	"Visual Studio Code" "IDE para programación en general")

if [ $choice = "CodeBlocks" ]; then
(	
	echo "10"
	echo "# Instalando CodeBlocks..."; source codeblocks.sh
	echo "# Terminado"
	echo "100"
	) |
	zenity --progress \
  	--title="iInstalación de Codeblocks" \
  	--text="Esperando por autenticación de Sudoo" \
	  --percentage=0

	if [ "$?" = -1 ] ; then
    	    zenity --error \
	          --text="Instalación fallida."
	fi
fi;
