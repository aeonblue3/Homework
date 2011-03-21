#!/bin/bash

clear
endOfProg=0
while test $endOfProg -eq 0
do
	cat << ENDOFMENU

Main Menu:
	(a) Add a contact
	(r) Remove a contact
	(s) Search contacts
	(d) Display contacts
	(e) Exit

ENDOFMENU
	echo -e 'Please enter your choice: \c'
	read userInput
	
	case $userInput in
		"a")
			clear
			./action.sh add
		;;
		"r")
			clear
			./action.sh remove
		;;
		"s")
			clear
			./action.sh search
		;;
		"d")
			clear
			./action.sh display
		;;
		"e")
			clear
			endOfProg=1
		;;
		*)
			clear
			echo Please choose from one of the menu options!
		;;
	esac
done

