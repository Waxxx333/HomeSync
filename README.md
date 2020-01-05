# HomeSync
![A-WaXxX Production](waxsync_s.png)

A script using rsync to backup up your ```$HOME``` directory.
Use this when you've made changes to your ```$HOME``` or just 
occasionally. You'll need a backup device, at least one. The
script has the option to use two backup devices, but the second
is not necessary. This script will make it so you don't have to go 
through the headache of reconfiguring your desktop preferences. Upon
a new installation, login as root, mount the backup device and cp all
contents to your new home directory. All "hidden" files will be backed up
(.bashrc, .bash_profile, .bash_history, .config, etc). It also creates a file of all currently installed 
packages on your machine so you can reinstall them simply. It creates a file ```$HOME/.config/homesync```, that contains
every time you've used it. It also lets the script know that your device path(s) are
set in the main script. 

### V-0.01 Release
This is a rolling release program
## Screenshot 
![homesync](https://i.imgur.com/NJIkdZ7.png "Optional title")

* **Video Demo**  [Click Here](https://vimeo.com/382709077)
## Getting Started
You can use the setup.sh script repeatedly if you change 
backup devices or paths to backup devices. The setup.sh script 
will always update ```homesync```. It will check if the script ```homesync```
has been run before by looking for a file in ```$HOME/.config/homesync```. You can run the setup.sh script as many times as needed to update devices' paths.

### Operating Systems
The program is currently compatible with Arch and Debian based systems.
* **EXAMPLE CODE**
```Shell
getOS() {
if grep -q Arch /etc/os-realease; then
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
* **EXAMPLE CODE**
```Shell
if [ ! /usr/bin/rsync ]; then
  echo -e "rsync not installed"
  echo -e "Install now ? [y/n]
  read yesno
  if [ $yesno = 'y' ]; then
    $OSPACKAGEMRG rsync
  else
    exit
  fi
fi
```
```Shell
if [ ! /usr/bin/bleachbit ]; then
  echo -e "rsync not installed"
  echo -e "Install now ? [y/n]
  read yesno
  if [ $yesno = 'y' ]; then
    $OSPACKAGEMRG bleachbit
  else
    exit
  fi
fi
```
### Installation:
* **Device One will use the -o flag** | **Device Two will use the -t flag**
```Shell
cd HomeSync && chmod a+x *
sudo ./setup.sh
homesync -[options(o/t)]
homesync -o
```
### Again, the setup.sh script can be ran as many times as you need.
It will prompt you for new paths, delete existing path(s) for your
device(s). Just use ```sudo ./setup.sh``` and it will update your ```homesync``` script !
### Updates To Come
- [ ] Backup whole / directory
- [ ] Give option to archive the backup
- [ ] Add a custom sync option
- [ ] Expand different distros
- [ ] Work on notify-send commands
- [ ] System maintenance option
- [ ] Check for storage on backup device to make sure there's enough space to sync your ```$HOME``` directory
- [ ] Include package manager help
# A TERROR SECURITY PRODUCTION
## Author
* **WaXxX**  [WaXxX GitHub |](https://github.com/waxxx333) [| WaXxX TwItTeR](https://twitter.com/waxxx333)
## Other team members
* **K3LD0**  [K3LD0 Twitter](https://twitter.com/K3ld0?s=20)
* **HaShBr0wN**  [HaShBr0wN GitHub |](https://github.com/hashbrown1013) [| HaShBr0wN TwItTeR](https://twitter.com/stephenahpohlis)
