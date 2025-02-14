#!/bin/bash
f1name=1
f2name=2
f3name=3
f4name=4
f5name=5

#get current user name
iuser=`whoami`

#1 step
fullpath=/home/$iuser/myfolder

if [ ! -d $fullpath ] # Проверка наличия файла.
then
	mkdir $fullpath
	echo "$fullpath is created!"
else
	echo "Folder is exist!"
fi


#2 step
for arg in "$f1name" "$f2name" "$f3name" "$f4name" "$f5name"
do
	touch "${fullpath}/${arg}"
	echo "File $arg created!"
done

#2.1 step
curdate=`date`
echo -e "Hello !! \n${curdate}" > "${fullpath}/${f1name}"
#echo "Hello !! \n ${curdate}" > "${fullpath}/${f1name}"
#2.2 step
echo "" > "${fullpath}/${f2name}"
exec `chmod ugo+rwx "${fullpath}/${f2name}"`
#2.3 step
randomvar=''
randDICT="abcdefghijklmnopqrstuvwxyzABCDIFGHIJKLMNOPQRSTUVWXYZ0123456789"
lengthDICT=${#randDICT}
for num in {0..20}
do
	tempnum=$RANDOM
	let "tempnum %= 64"
	randomvar="${randomvar}${randDICT:$tempnum:1}"
	#echo ${randDICT:$tempnum:1}
	#echo $tempnum
	#echo $randomvar
done

#echo $tempnum
#echo $randomvar
#2.3 step
echo $randomvar > "${fullpath}/${f3name}"
#2.4 step
echo "" > "${fullpath}/${f4name}"
echo "" > "${fullpath}/${f5name}"
