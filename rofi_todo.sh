#!/bin/bash 

first_use () {
	mkdir ~/.todo
	touch ~/.todo/todo_list
	echo "+ ADD TASK" >> ~/.todo/todo_list
}
add_task () {
	NEW_TASK=$(rofi -dmenu -p "ADD TASK:")
	echo $NEW_TASK >> ~/.todo/todo_list	
}

remove_task () {
	echo
}

show_rofi() {
	cat ~/.todo/todo_list | rofi -dmenu
}

if [[ -d ~/.todo ]] ; then
	choice=$(show_rofi)
	if [[ $choice = "+ ADD TASK" ]] ; then
		NEW_TASK=$(add_task)
		echo $NEW_TASK >> ~/.todo/todo_list
	fi
else
	first_use
	choice=$(show_rofi)
	
fi
