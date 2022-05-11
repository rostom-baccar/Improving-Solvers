#Creating output file
year="2020";
rm $year-data;
touch $year-data;
cd Uncompressed-fzn-files-for-PIR/$year/new-gen;
i=0;

#Displaying number of instances in folder
numfiles=$(ls -1 --file-type | grep -v '/$' | wc -l);

#Looping over all fzn files & run the command
for fzn in *; do
        cd ../../..;
        cat $year-data;
        echo "---------------------------------------------------";
        echo $(./mistral-fz -t 1 --nb_configurations 1  Uncompressed-fzn-files-for-PIR/$year/new-gen/$fzn)>>$year-data;
        cd Uncompressed-fzn-files-for-PIR/$year/new-gen;
         i=$((i+1));
        echo;
        echo "---------------------------------------------------";
        echo "Progress: (" $i" / "$numfiles" ) instances processed";
        echo "Content of "$year"-data :";

done


