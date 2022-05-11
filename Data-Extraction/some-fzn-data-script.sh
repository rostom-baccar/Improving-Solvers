#Creating output file
rm some-fzn-data;
touch some-fzn-data;
cd Uncompressed-fzn-files-for-PIR/some-fzn;
i=0;

#Displaying number of instances in folder
numfiles=$(ls -1 --file-type | grep -v '/$' | wc -l);

#Looping over all fzn files & run the command
for fzn in *; do
        cd ../..;
        cat some-fzn-data;
        echo "---------------------------------------------------";
        echo $(./mistral-fz -t 1 --nb_configurations 1  Uncompressed-fzn-files-for-PIR/some-fzn/$fzn)>>some-fzn--data;
        cd Uncompressed-fzn-files-for-PIR/some-fzn;
         i=$((i+1));
        echo;
        echo "---------------------------------------------------";
        echo "Progress: (" $i" / "$numfiles" ) instances processed";
        echo "Content of some-fzn-data :";

done


