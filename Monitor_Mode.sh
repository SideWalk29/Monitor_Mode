clear
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "You may have to run it as root or use the sudo command "
    exit
fi

function IWdev () {
 clear
 sudo iw dev
}

function IWconfig () {
 clear
 sudo ifconfig
}

function AIrmon () {
 clear
 sudo airmon-ng
}

printf "1.- Iw\n"
printf "2.- Iwconfig\n"
printf "3.- Airmon-ng\n"
printf "*.- Exit the script\n"

read -p "Select one the interior optiones : " menu

if [[ $menu == "1" ]]; then
 IWdev
 echo
 read -p "Which device you wanna set it to monitor mode : " dev
 sudo ip link set $dev down
 sudo iw $dev set monitor mode
 sudo ip link set $dev up
 echo "The change has been done successfully"

elif [[ $menu == "2" ]]; then
 IWconfig
 read -p "Which device you wanna set it to monitor mode : " dev
 sudo ifconfig $dev down
 sudo iwconfig $dev mode monitor
 sudo ifconfig $dev up
 echo "The change has been done successfully"

elif [[ $menu == "3" ]]; then
 AIrmon
 read -p "Which adapter you wanna se to set to monitor mode : " dev
 sudo airmon-ng start $dev
 sudo airmon-ng check kill
 sudo airmon-ng start $dev


elif [[ $menu == "*" ]]; then
 echo Saliendo...&& sleep 3 && clear && exit


else
 echo Dont invent, there is just 4 options and thank you

fi

