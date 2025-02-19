#!/bin/bash
# folder name for script
SCRFOLDER="myfolder"
#get current user name
iuser=$(whoami)
# get full path for script
fullpath=/home/$iuser/$SCRFOLDER

#3.1 files counter in SCRFOLDER
allFiles=$(ls "$fullpath")
iter=0
for each in $allFiles
do
	arrFiles[iter]=$each
	(("iter += 1"))
done
echo "Files count: ${#arrFiles[@]}"

# test if 0 files in SCRFOLDER
if [ "${#arrFiles[@]}" -lt 1 ]
then 
	echo "Exit: no files"
	exit 0
fi
#3.2 change rights to 664 if 777
if [ "${#arrFiles[@]}" -gt 1 ]
then
	filechmod=$(stat -c '%a' "${fullpath}/${arrFiles[1]}")
	if [ "$filechmod" -eq 777 ]
	then
		exec $(chmod u=rw,g=rw,o=r "${fullpath}/${arrFiles[1]}")
		echo "chmod of file ${arrFiles[1]} changed to 664"

	fi
fi
#3.3 delete every empty file in SCRFOLDER.
for each in $allFiles
do
	filestr=$(cat "${fullpath}"/"$each")
	if [ "$filestr" == "" ]
	then
		echo "File is empty: $each ... Delete him!"
		#echo $each
		
		exec $(rm "${fullpath}"/"$each")
		arrFiles=("${arrFiles[@]/$each}")
		
	fi
done
#echo ${arrFiles[@]}

#3.4 dell all text exept 1 line in files
allFiles=$(ls "$fullpath")
#echo ${arrFiles[@]}
iter=0
arrFiles=()
for each in $allFiles
do
	firstline=$(head -1 "${fullpath}"/"$each")
	echo "$firstline" > "${fullpath}/$each"
done
