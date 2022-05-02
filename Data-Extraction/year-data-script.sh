#Creating output file
year="2018"
rm raw-data-$year
touch raw-data-$year
cd Uncompressed-fzn-files-for-PIR/$year/generated-fzn
for fzn in *; do
        cd ../../..;
        echo $(./mistral-fz -t 5 --nb_configurations 5 Uncompressed-fzn-files-for-PIR/$year/generate>
        cd Uncompressed-fzn-files-for-PIR/$year/generated-fzn;
done

