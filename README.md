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
(.bashrc, .bash_profile, etc). It also creates a file of all currently installed 
packages on your machine so you can reinstall them simply. Click the image to 
watch a demo video.
### This is only V-0.01
Many more to come

[![HomeSync](https://i.imgur.com/NJIkdZ7.png)](https://vimeo.com/382709077 "HomeSync Demo")

## Getting Started
You can use the setup.sh script repeatedly if you change 
backup devices or paths to backup devices. The setup.sh script 
will always update ```homesync```. It will check if the script has 
been ran before and give you the option of adding or editing the 1/2
backup device paths. The script is compatible with Debian and Arch based
systems currently. 
### Dependencies:
The script is made to detect Arch based or Debian based systems. So installing
the dependencies is just the click of a button. 
```
pacman -S rsync / apt-get install rsync
pacman -S bleachbit / apt-get install bleachbit
pacman -S notify-send / apt-get install notify-send
```
## Necessary dependencies:
It will install necessary dependencies if they're not already installed.
### Installation:
```
cd HomeSync && chmod a+x *
sudo ./setup.sh
homesync
```
### Many Updates To Come
- [ ] Backup whole / directory
- [ ] Give option to archive the backup
- [ ] Add a custom sync option
- [ ] Expand different distros
- [ ] Work on notify-send commands
- [ ] System maintenance option
# A TERROR SECURITY PRODUCTION
## Author
* **WaXxX**  [WaXxX GitHub |](https://github.com/waxxx333) [| WaXxX TwItTeR](https://twitter.com/waxxx333)
## Other team members
* **K3LD0**  [K3LD0 Twitter](https://twitter.com/K3ld0?s=20)
* **HaShBr0wN**  [HaShBr0wN GitHub |](https://github.com/hashbrown1013) [| HaShBr0wN TwItTeR](https://twitter.com/stephenahpohlis)
