#!/bin/bash
#get current user name
iuser=`whoami`
fullpath=/home/$iuser/myfolder

#3.1 files counter
allFiles=`ls $fullpath`
iter=0
for each in $allFiles
do
	arrFiles[iter]=$each
	let "iter += 1"
done
echo "Files count: ${#arrFiles[@]}"

if [ "${#arrFiles[@]}" -lt 1 ]
then 
	echo "Exit: no files"
	exit 0
fi
#3.2 777 to 664
if [ "${#arrFiles[@]}" -gt 1 ]
then
	filechmod=`stat -c '%a' "${fullpath}/${arrFiles[1]}"`
	if [ "$filechmod" -eq 777 ]
	then
		exec `chmod u=rw,g=rw,o=r "${fullpath}/${arrFiles[1]}"`
		echo "chmod of file ${arrFiles[1]} changed to 664"

	fi
fi
#3.3 del empty files
#echo ${arrFiles[@]}
for each in $allFiles
do
	#echo $each
	filestr=`cat ${fullpath}/$each`
	#echo $filestr
	if [ "$filestr" == "" ]
	then
		echo "File is empty: $each ... Delete him!"
		#echo $each
		
		exec `rm ${fullpath}/$each`
		arrFiles=("${arrFiles[@]/$each}")
		
	fi
done
#echo ${arrFiles[@]}

#3.4 dell > 1 line text
allFiles=`ls $fullpath`
#echo ${arrFiles[@]}
iter=0
arrFiles=()
for each in $allFiles
do
	firstline=`head -1 ${fullpath}/$each`
	echo $firstline > "${fullpath}/$each"
done
