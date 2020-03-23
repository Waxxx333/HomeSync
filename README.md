[![GitHub version](https://badge.fury.io/gh/Waxxx333%2FHomeSync.svg)](https://badge.fury.io/gh/Waxxx333%2FHomeSync)
[![Python Version](https://img.shields.io/badge/Python-V2-<green.svg)](https://shields.io/)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

# HomeSync :house: :arrows_clockwise:
![A-WaXxX Production](waxsync_s.png)

A script using rsync & bleachbit to backup up your ```$HOME``` directory to a device.
Use this when you've made changes to your ```$HOME```directory; just 
occasionally, or before a reinstallation. You'll need a backup device - at least one. The
script has the option to use two backup devices, but the second device
is not necessary. This script will make it so you don't have to go 
through the headache of reconfiguring your desktop preferences. Upon
a new installation: login as root, mount the backup device and use ```cp -r *``` to copy all
contents of your previous ```$HOME``` directory to your new home directory. All "hidden" files will be backed up
(.bashrc, .bash_profile, .bash_history, .config, etc). It also creates a file of all currently installed 
packages on your machine so you can automatically reinstall them simply. It creates a file: ```$HOME/.config/homesync```, that records the date and time of every time you've ran the it. The file also lets the script know that your device path(s) are
set in the main script. 
## Screenshot 
![homesync](https://i.imgur.com/9QsfbP1.png)
* **Video Demo**  [Click Here](https://vimeo.com/382709077)
## Getting Started
You can use the ```setup.sh``` script repeatedly if you change 
backup devices or paths to backup devices. The ```setup.sh``` script 
will always update ```homesync```. It will check if the script ```homesync```
has been run before by looking for the file in ```$HOME/.config/homesync```. You can run the ```setup.sh``` script as many times as needed to update device's paths.

### Operating Systems
The program is currently compatible with Arch and Debian based systems.
```diff
-I've noticed using my Raspberry Pi 3B that it doesn't allow you to run homesync as a regular user. 
-Please give feedback if your system does the same so I can fix it.
```
* **EXAMPLE CODE**
```Shell
getOS() {
if grep -q arch /etc/os-realease; then
  OS="Arch"
  OSPACKAGEMGR="sudo pacman -S "
elif grep -q bian /etc/os-release; then
  OS="Debian"
  OSPACKAGEMGR="sudo apt-get install "
fi
}
```
## Necessary Dependencies:
It will install necessary dependencies if they're not already installed, without the hassle of typing out the commands yourself.
- rsync
- bleachbit
- At least one device to backup contents from ```$HOME```
### Installation:
Running ```sudo ./setup.sh``` will prompt your for the path(s) to your backup
device(s), store them in ```homesync``` and then install ```homesync``` to ```Shell
/usr/bin/homesync```. However, you do not need to run it as root.

```console
cd HomeSync && chmod a+x *
sudo ./setup.sh
homesync -h
```
### Again, the setup.sh script can be ran as many times as you need.
It will prompt you for new paths, delete existing path(s) for your
device(s). Just use ```sudo ./setup.sh``` and it will update your ```homesync``` script !
### Update & Idea Log:
- [ ] Check for storage on backup device to make sure there's enough space to sync your ```$HOME``` directory
- [ ] Backup whole ```/root``` directory
- [ ] Give option to archive the backup
- [ ] Add a custom sync option
- [ ] Expand different distros
- [ ] System maintenance option
- [ ] Include a package manager helper
- [ ] Enable to sync from Device One to Device Two
  - [x] Make an option to view your Device path(s)
  - [x] Change distros to lower case for optimized OS detection
  - [x] Removed notify-send
  - [x] Add an update-script function and git as dependency
# [!] A TERROR SECURITY PRODUCTION [!]
![Imgur](https://imgur.com/Pgat8QI.jpg)
* **TerrorSecurity** [TerrorSecurity Twitter](https://twitter.com/TerrorSecurity)
## Author
* **WaXxX**  [WaXxX GitHub |](https://github.com/waxxx333) [| WaXxX TwItTeR](https://twitter.com/waxxx333)
## Other team members
* **K3LD0**  [K3LD0 Twitter](https://twitter.com/K3ld0?s=20)
* **HaShBr0wN**  [HaShBr0wN GitHub |](https://github.com/hashbrown1013) [| HaShBr0wN TwItTeR](https://twitter.com/stephenahpohlis)
## README.md Editor 
* **Sarah Provencher** [Sarah Twitter](https://twitter.com/SarahProvenche6) 
