#!/bin/sh
cd "$(dirname "$0")"
folderName=""
folderStamp=0
for fName in *; do 
	fStamp=$(echo $fName|awk 'BEGIN{FS="_"}{}{print $2}')
	if [ "$fStamp" = "" ]; then 
#		echo "skip ${fName}"
		continue;
	fi
	if [ "$folderName" = "" ]; then
		folderName=$fName
		folderStamp=$(echo $fName|awk 'BEGIN{FS="_"}{}{print $2}')
#		echo "init ${folderName} ${folderStamp}"
		continue
	fi
#	echo "to compare ${fStamp} and ${folderStamp}"
	if [ $fStamp -gt $folderStamp ] ; then
		folderName=$fName
		folderStamp=$fStamp
#		echo "newer ${fName}"
	fi
done

cd $folderName
chmod 777 -R tools/
java -jar MIUINewThemeEditor.jar
