#Creating output file
rm raw-data-some-fzn
touch raw-data-some-fzn
cd Uncompressed-fzn-files-for-PIR/some-fzn
for fzn in *; do
        cd ../..;
        echo $(./mistral-fz -t 5 --nb_configurations 5 Uncompressed-fzn-files-for-PIR/some-fzn/$fzn)>
        cd Uncompressed-fzn-files-for-PIR/some-fzn;
done


