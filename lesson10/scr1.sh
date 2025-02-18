#!/bin/bash
# names for new files
F1NAME=1
F2NAME=2
F3NAME=3
F4NAME=4
F5NAME=5
# folder name for script
SCRFOLDER="myfolder"
# random length for 3d file: 100 = NUMOFRAND * 5
NUMOFRAND=20

#get current user name
iuser=$(whoami)

# get full path for script
fullpath=/home/$iuser/$SCRFOLDER
# step 1: create new folder
if [ ! -d "$fullpath" ]
then
	mkdir "$fullpath"
	echo "$fullpath is created!"
else
	echo "Folder is exist!"
fi


#2 step: create new files
for arg in "$F1NAME" "$F2NAME" "$F3NAME" "$F4NAME" "$F5NAME"
do
	touch "${fullpath}/${arg}"
	echo "File $arg created!"
done

#2.1 step: write greeting and date to file
curdate=$(date)
echo -e "Hello !! \n${curdate}" > "${fullpath}/${F1NAME}"
#echo "Hello !! \n ${curdate}" > "${fullpath}/${F1NAME}"
#2.2 step: change rights to 2d file
echo "" > "${fullpath}/${F2NAME}"
chmod ugo+rwx "${fullpath}/${F2NAME}"
#2.3 step: generate random string from DICT by $RANDOM function
randomvar=''
randDICT="abcdefghijklmnopqrstuvwxyzABCDIFGHIJKLMNOPQRSTUVWXYZ0123456789"

for num in $(seq 0 NUMOFRAND)
do
	tempnum=$RANDOM
	(("tempnum %= 64"))
	randomvar="${randomvar}${randDICT:$tempnum:1}"
done

#write random string to 3d file
echo "$randomvar" > "${fullpath}/${F3NAME}"
#2.4 step: clear 4d and 5d files
echo "" > "${fullpath}/${F4NAME}"
echo "" > "${fullpath}/${F5NAME}"
