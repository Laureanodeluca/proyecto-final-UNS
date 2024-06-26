#!/bin/bash

check-apt() {
    INSTALLED=$(apt list -qq --installed $1 | grep -o "instalado")
	if [ "$INSTALLED" = "instalado" ]; then
    	return 0;
	else 
		return 1;
	fi
}

check-generic() {
	if [ -d $1 ]; then
		return 0;
	else
		return 1;
	fi
}

case $1 in
    "codeblocks" | "lazarus" | "swi-prolog" | "bluej" | "staruml" | "logisim" | "postgresql" | "kotlin" | "visual-studio-code" | "virtualbox" | "mysql-client" | "mysql-server" | "npm" | "php" | "projectlibre" | "pmd" | "jenkins" | "google-chrome" | "github-desktop | discord")
        if [ "$1" = "visual-studio-code" ]; then
            check-apt code
        else
            check-apt $1
        fi
        ;;
    "infostat" )
        if [ -d ~/.wine/drive_c/Program\ Files\ \(x86\)/InfoStat ]; then
            return 0
        else
            return 1
        fi
        ;;
    *)
        check-generic ~/$1
        ;;
esac
