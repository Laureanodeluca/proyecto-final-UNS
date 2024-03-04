#!/bin/bash
LATEST=$(curl -sL https://api.github.com/repos/Laureanodeluca/proyecto-final-UNS/releases/latest | grep "tag_name" | grep -o "[0-9]*\.[0-9]*")
INSTALLED=$(main --version | grep -o "[0-9]*\.[0-9]*")

if [ "$LATEST" != "$INSTALLED" ]; then
    yad --title="UNS-Pacman Updater" \
				--image="info" \
				--text="Se encontró una nueva versión de UNS-Pacman.\n\n¿Desea instalarla?" \
				--window-icon="info" \
				--center \
				--borders=15 \
				--button="Si":0 \
				--button="No":1

    if [ $? -eq 0 ]; then 
        URL=$(curl -sL https://api.github.com/repos/Laureanodeluca/proyecto-final-UNS/releases/latest | grep "browser_download_url.*deb"| cut -d : -f 2,3 | tr -d \")
        wget ${URL} -P ~ 2>&1 | grep --line-buffered -Eo "[0-9]{1,2}%" | yad --progress --auto-kill --auto-close --borders=15 --no-buttons --text="Descargando UNS-Pacman..." --title="UNS-Pacman Updater"
        pkexec dpkg -i ~/uns-pacman_${LATEST}_all.deb | zenity --progress --pulsate --no-cancel --auto-kill --auto-close --width=350 --title="UNS-Pacman Updater" --text="Instalando paquete..."
    fi;
fi;

