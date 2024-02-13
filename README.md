# proyecto-final-UNS
Proyecto final de la carrera Ingeniería en Sistemas de Información. UNS (2024)

## Pasos para crear una iso
Los siguientes son los pasos para crear el sistema actual en una ISO instalable (Válido para: Debian, Ubuntu, Arch y Manjaro)

Primero, instalar curl

```
sudo apt install curl
```

Instalar la clave del repositorio de `penguins-eggs`

```
curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
```

Configurar el paquete

```
echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list > /dev/null
```

Actualizar la lista de repositorios

```
sudo apt update
```

Instalar `eggs`

```
sudo apt install eggs
```

Instalar calamares

```
sudo eggs calamares --install
```

Instalar Grub-efi

```
sudo apt install grub-efi-amd64
```

> Se puede cambiar el user y el password del live ISO, el huso horario, y más cosas editando el archivo /etc/penguins-eggs.d/eggs.yaml con un editor de texto.

Para crear un live CD (ISO) en el sistema SIN datos de usuario, usar el comando:

```
sudo eggs produce --basename <NOMBRE> --standard
```


