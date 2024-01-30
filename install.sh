#!/bin/bash 

something () {
	clear
	printf "
   _            _                    __ _ 
  | |_ ___   __| | ___    _ __ ___  / _(_)
  | __/ _ \ / _  |/ _ \  | '__/ _ \| |_| |
  | || (_) | (_| | (_) | | | | (_) |  _| |
   \__\___/ \__,_|\___/  |_|  \___/|_| |_|
 
    .: by https://github.com/am-shm :.   
 \n"

	echo
	echo " You can change style of rofi by editing main script"
	echo " It have 2 options: windowed and fullscreen"
	echo 
	echo
}
something
mkdir ~/.config/rofi/
clear
something
printf "[ ] copying files to your paths:"
cp ./full_screen.rasi ~/.config/rofi/ 
cp ./windowed.rasi ~/.config/rofi/ 
cp ./task_prompt.rasi ~/.config/rofi
sudo cp ./rofi_todo.sh /usr/local/bin/rofi_todo
sleep 2
clear
something
printf "[*] copying files to your paths: DONE! \n\n"
