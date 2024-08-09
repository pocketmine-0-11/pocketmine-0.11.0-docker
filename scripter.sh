#!/bin/bash
# Shamelessly stolen from https://linuxconfig.org/bash-script-yes-no-prompt-example
while true; do

read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	[yY] ) echo ok ;
		break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac

done

bash /pocketmine/server/start.sh
