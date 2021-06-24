echo 'Enter the name of the file you want to decompress: '
read fname
currdir=`pwd`
temp=$currdir/$fname
ftype=`file --mime-type $temp`
tartest="none"

if [[ ${ftype:(-4)} == "gzip" || ${ftype:(-3)} == "tar" || ${ftype:(-5)} == "bzip2" ]]
then
	while [[ ${ftype:(-4)} == "gzip" || ${ftype:(-3)} == "tar" || ${ftype:(-5)} == "bzip2" ]]
		do
		if [[ ${ftype:(-4)} == "gzip" ]]
		then
			echo 'Decompressing gzip...'
			mv $temp temp.gz
			gzip -df temp.gz > temp
			temp=$currdir/temp
			ftype=`file --mime-type $temp`
		elif [ ${ftype:(-3)} == "tar" ]
		then
			echo 'Decompressing tar...'
			tar --extract -f $temp
			tartest=`tar --list -f $temp`
			mv $tartest temp
			temp=$currdir/temp
			ftype=`file --mime-type $temp`
		elif [ ${ftype:(-5)} == "bzip2" ]
		then
			echo 'Decompressing bzip2...'
			bzip2 -d $temp
			mv temp.out temp
			temp=$currdir/temp
			ftype=`file --mime-type $temp`
		fi
	done
else
	echo 'Selected file is not a valid type (gzip, bzip2, tar)'
fi

mv $temp final
echo 'Done decompressing'
echo 'Ouput is at '$currdir'/final'
