#!/usr/bin/bash
# Variables
filename=$(basename $0)
RED="\033[38;5;196m"; DIM='\e[2m'; BOLD='\033[01m'; BLUE="\033[38;5;39m"; YELLOW="\033[38;5;226m"; TURQUOISE="\033[38;5;45m"
BLINK='\e[5m'; SEPERATOR='≽ '; GREEN="\033[38;5;46m"; WHITE="\033[38;5;15m"; UNDERLINE='\033[04m'; RESET='\033[0m'; ITALIC='\e[3m';
circle=( 
        ◜
        ◠
        ◝
        ◞
        ◡
        ◟
      )
# Make sure running as root
if [ $UID != 0 ]; then
        echo -e $BOLD$BLINK$DIM$RED"THIS SCRIPT MUST BE RUN AS ROOT !"
        echo -e "Usage: sudo ./$filename $RESET"
        exit
fi
# CHECK WHETHER IT'S A DEBIAN OR arch BASED SYSTEM
if grep -q arch /etc/*release; then
	OS="arch";
	echo -e "$BLINK$WHITE	    You're using an arch based system $RESET"
elif grep -q bian /etc/*release; then
	OS="Debian";	
	echo -e "$BLINK$WHITE	    You're using an Debian based system $RESET"
fi
# Start dependency check
# Check for notfiy-send
echo -e $DIM$GREEN"	::$DIM$BOLD$BLUE[$GREEN$BLINK✪$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE Checking for dependencies $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK✪$RESET$DIM$BOLD$BLUE]$GREEN::"
for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
if [ -f /usr/bin/notify-send ]; then
	echo -e $GREEN"	::$DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE notify-send installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
	hash notify-send
	notify-send --icon=$PWD/start.png "Installation beginning" "Press ctl+c now to stop the process"
	for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
else
	echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE notify-send not installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
	echo -e "Install notify-send now ?"
	read -p "$SEPERATOR " notify
	if [ $notify = 'y' ]; then
		if [ $OS = 'arch' ]; then
		sudo pacman -S --noconfirm notify-send
		elif [ $OS = 'Debian' ]; then
			sudo apt-get install notify-send
		fi
		echo -e $GREEN"	:: $DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE notify-send installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
		notify-send --icon=$PWD/start.png "Notify-send installed" "You now have notify-send installed on your machine. It's a useful tool to set reminders, etc."
		for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
	else
		echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE Aborting script $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
		set -e
	fi
fi
# Check for rsync
if [ -f /usr/bin/rsync ]; then
	echo -e $GREEN"	::$DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE rsync installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
	hash rsync
	for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
else
	echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE rsync not installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
	echo -e "Install rsync now ?"
	read -p "$SEPERATOR " rsync
	if [ $rsync = 'y' ]; then
		if [ $OS = 'arch' ]; then
		sudo pacman -S --noconfirm rsync
		elif [ $OS = 'Debian' ]; then
			sudo apt-get install rsync
		fi
		for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
		echo -e $GREEN"	:: $DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE rsync installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
	else
		echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE Aborting script $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
		set -e
	fi
fi
# Check for bleachbit
if [ -f /usr/bin/bleachbit ]; then
	echo -e $GREEN"	::$DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE bleachbit installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
	hash bleachbit
	for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
else 
	echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE bleachbit not installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
	echo -e "Install bleachbit now ?"
	read -p "$SEPERATOR " bleachbit
	if [ $bleachbit = 'y' ]; then
		if [ $OS = 'Arch{based system}' ]; then
		sudo pacman -S --noconfirm bleachbit
		elif [ $OS = 'Debian{based system}' ]; then
			sudo apt-get install bleachbit
		fi
		for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
		echo -e $GREEN"	:: $DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE bleachbit installed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
	else
		echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE Aborting script $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
		set -e
	fi
fi
# Make sure all dependencies are installed
if [ -f /usr/bin/bleachbit ]; then
	if [ -f /usr/bin/rsync ]; then
		if [ -f /usr/bin/notify-send ]; then
			notify-send --icon=$PWD/done.png "Dependency setup finished !" "All dependencies are now installed on your machine."
		fi
	fi
	else 
	echo -e $RED"	::$DIM$BOLD$BLUE[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE Aborting script: dependencies not installed ! $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$RED$BLINK✘$RESET$DIM$BOLD$BLUE]$GREEN::"
fi
# Check if script has been ran before
if [ -f $HOME/.config/homesync ]; then
	echo -e $RESET$WHITE$BOLD$ITALIC"You have alread ran this script. You already have device path(s) in the sync script. Continuing will remove the path(s) and you'll
be prompted to set new path(s) to your backup device(s)."
	echo -e "You'll need the EXACT path (/run/media/$USER/device_Name)"
	echo -e "Press enter to continue, deleting your current path(s)."
	echo -e "Or press ctl+c to stop"
	read 
	echo -e $RED"Deleting already set path(s) in 3 seconds. . . Press ctl+c to stop [!]"	
	for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
	sed -i '/DEVONE=/d' homesync
	sed -i '/DEVTWO=/d' homesync
	echo -e $GREEN"::$DIM$BOLD$BLUE[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$RESET$BOLD$GREEN:: $WHITE{$DIM$YELLOW$UNDERLINE Device paths removed $RESET$BOLD$WHITE} $GREEN:: $BLUE$DIM[$GREEN$BLINK√$RESET$DIM$BOLD$BLUE]$GREEN::"
	for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
	echo "homesync updated on $(date +%A,+%m/%d/%Y) at $(date +%r)" >> $HOME/.config/homesync
	echo -e "Loading. . . "
	for pic in *.png;do sudo cp -f $pic /usr/share/icons;echo "Moving $pic to /usr/share/icons" ;done
	echo -e $WHITE"Currently mounted devices: $(df -hx tmpfs --output=target)"
	exec sudo python2 etc.py 
else
	touch $HOME/.config/homesync
	echo $RESET$WHITE$BOLD$ITALIC"homesync installed on $(date +%A,+%m/%d/%Y) at $(date +%r)" >> $HOME/.config/homesync
	echo -e "Now that you've installed the necessary dependencies, you're going to need to set the path(s) to your
device(s). You'll be prompted next to enter the path(s) to the device(s). Make sure you get the EXACT path to the device(s).
If you only have one device, only enter the path to the device when prompted with 'DEVICE ONE'. Leave 'DEVICE TWO' blank
if you are only using one device. If you're only using one device, you'll use the -o{o for one} flag when running the homesync script. Later on, if you need
to add another device path or add a second device path, you can just re-run this script. Your path(s) from the first
time will be deleted, so you'll have to re-enter the path to any device you are going to continue using."
	echo -e "You'll need the EXACT path (/run/media/$USER/device_Name)"
	echo -e "Press enter to continue. . . "
	read
	echo -e "Loading. . . "
	for i in `seq 3`;do for i in ${circle[@]};do echo -ne $TURQUOISE"\r$i";sleep 0.1;done;sleep 0.1;done;echo
	for pic in *.png;do sudo cp -f $pic /usr/share/icons;echo "Moving $pic to /usr/share/icons" ;done
	echo -e $WHITE"Currently mounted devices: $(df -hx tmpfs --output=target)"
	exec sudo python2 etc.py
fi
