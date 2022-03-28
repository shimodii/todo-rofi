#!/bin/bash 

DIR_TODO=~/.todo
first_use () {
	mkdir $DIR_TODO
	cd $DIR_TODO
	touch "+ ADD TASK"
}
new_task () {
	NEW_TASK=$(rofi -dmenu -p "ADD TASK:")
	cd $DIR_TODO
	touch "$NEW_TASK"
}

show_rofi () {
	ls -1 $DIR_TODO | rofi -dmenu -p ">"
}

if [[ -d $DIR_TODO ]] ; then
	choice=$(show_rofi)
	if [[ $choice = "+ ADD TASK" ]] ; then
		NEW_TASK=$(new_task)
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
