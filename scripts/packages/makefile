.PHONY: codeblocks
codeblocks:
	$(call apt-install,codeblocks)

.PHONY: lazarus
lazarus:
	$(call apt-install,lazarus)

define apt-install
	@pkexec apt-get install $1 -y | zenity --progress --pulsate --no-cancel --auto-kill --auto-close
endef
