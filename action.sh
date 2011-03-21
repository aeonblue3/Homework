#!/bin/bash

endDisplay=0

case $1 in
	"display")
	while test $endDisplay -eq 0
	do
		cat << ENDOFMENU
	
[Display Contacts]
	(1) Display All
	(2) Display All by First Name
	(3) Return to Main Menu

ENDOFMENU
		echo -e 'Please enter your choice: \c'
		read displayInput

		case $displayInput in
			"1")
				clear
				awk -F: '{print "First Name: \t"$1 "\nLast Name: \t"$2 "\nPhone Number: \t"$3 "\nAddress: \t"$4 "\nEmail Address: \t"$5 "\n\n"}' chris_contacts
			;;
			"2")
				clear
				sort chris_contacts | awk -F: '{print "First Name: \t"$1 "\nLast Name: \t"$2 "\nPhone Number: \t"$3 "\nAddress: \t"$4 "\nEmail Address: \t"$5 "\n\n"}'
			;;
			"3")
				clear
				endDisplay=1
			;;
			"*")
				echo Please choose from one of the menu options!
			;;
		esac
	done
	;;
	"search")
		echo '[Search Contacts]'
		echo -e 'Enter the first name of the contact: \c'
		read searchInput

		grep -i $searchInput chris_contacts | awk -F: '{print "First Name: \t"$1 "\nLast Name: \t"$2 "\nPhone Number: \t"$3 "\nAddress: \t"$4 "\nEmail Address: \t"$5 "\n\n"}'
	;;
	"add")
		echo '[Add a Contact]'
		echo -e 'Enter First Name: \c'
		read firstname
		echo -e 'Enter Last Name: \c'
		read lastname
		echo -e 'Enter Phone Number: \c'
		read phone
		echo -e 'Enter Address: \c'
		read address
		echo -e 'Enter Email Address: \c'
		read email

		echo $firstname:$lastname:$phone:$address:$email | cat >> chris_contacts

		echo $firstname $lastname has been added to your contacts!
		unset firstname lastname phone address email
	;;
	"remove")
		echo '[Remove a Contact]'
		echo -e 'First Name: \c'
		read firstname
		echo -e 'Last Name: \c'
		read lastname

		sed "/$firstname:$lastname/d" chris_contacts > temp

		cat temp > chris_contacts
		rm temp
		echo $firstname $lastname has been removed!
		unset firstname lastname
	;;
	esac

