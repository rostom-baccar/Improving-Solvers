#!/bin/sh
year="2020"
cd $year-probs
echo "Content of current directory:"
ls
n=$(find * -maxdepth 0 -type d | wc -l)
echo "Number of files is $n"
echo "Beginning generation of files..."

for folder in *; do
    if [ -d "$folder" ]; then
   	echo "Current folder: "$folder;
	cd $folder;

#Verifying mzn file
	if [ -e *.mzn ]; then echo "mzn file found"; else echo "No mzn file found"; fi

#Identifying mzn file
	for f in *; do 
		if [ "$f" = *".mzn" ]; then mznFile=$f; fi
	done
	
#Creating array of dzn files
	dznArray=()
	while IFS= read -rd '' files; do dznArray+=("$files")
 	done < <(find . -type f -name '*.dzn' -print0)
	
#Generating fzn files
	for i in ${dznArray[@]}; do
		dznFile=${i:2};
		fznFile=${dznFile::-4}".fzn"
		minizinc --compile --solver org.minizinc.mzn-fzn -I /home/rostom/Desktop/Projects/Mistral-PIR/fz/mznlib $mznFile $dznFile --fzn $fznFile;
	done

#Moving all fzn files to the same folder
	mv *.fzn /home/rostom/Desktop/Projects/Mistral-PIR/fz/Uncompressed-fzn-files-for-PIR/$year/new-gen;
	
	cd ..
    fi
done
echo "fzn files generated successfully."
