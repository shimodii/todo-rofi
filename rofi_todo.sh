#!/bin/bash 

##############################################
##           select theme here!             ##
##############################################
THEME="windowed.rasi"
## AVAILABLE OPTIONS : windowed.rasi - full_screen.rasi
##############################################


DIR_TODO=~/.todo
first_use () {
	mkdir $DIR_TODO
	cd $DIR_TODO
	touch "+ ADD TASK"
	touch "> EXIT"
}
new_task () {
	NEW_TASK=$(rofi -dmenu -p "ADD TASK:" -theme ~/.config/rofi/task_prompt.rasi)
	cd $DIR_TODO
	touch "$NEW_TASK"
}

show_rofi () {
	ls -1 $DIR_TODO | rofi -dmenu -p ">" -theme ~/.config/rofi/$THEME
}
while true
do 
	if [[ -d $DIR_TODO ]] ; then
		choice=$(show_rofi)
		if [[ $choice = "+ ADD TASK" ]] ; then
			NEW_TASK=$(new_task)
		elif [[ $choice = "> EXIT" ]] ; then
			exit 
		else
			cd $DIR_TODO
			rm "$choice"
		fi
	else
		first_use
		choice=$(show_rofi)
		cd $DIR_TODO
		rm "$choice"
	fi

done
