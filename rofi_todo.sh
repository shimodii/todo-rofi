#!/bin/bash 

DIR="~/.todo"
first_use () {
	mkdir $DIR
	cd $DIR
	touch "+ ADD TASK"
}
new_task () {
	NEW_TASK=$(rofi -dmenu -p "ADD TASK:")
	touch /tmp/todo_temp $NEW_TASK
}

show_rofi () {
	ls -1 $DIR | rofi -dmenu -p ">"
}

if [[ -d $DIR ]] ; then
	choice=$(show_rofi)
	if [[ $choice = "+ ADD TASK" ]] ; then
		NEW_TASK=$(new_task)
	else
		cd $DIR
		rm $choice
	fi
else
	first_use
	choice=$(show_rofi)
	cd $DIR
	rm $choice	
fi
