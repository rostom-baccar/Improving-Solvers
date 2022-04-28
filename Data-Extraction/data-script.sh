  GNU nano 4.8                                            script.sh                                                      
#Creating output file
rm raw-data
touch raw-data
cd data/some-fzn/ecp
for fzn in *; do
        cd ../../..;
        #echo $(./mistral-fz -t 5 --nb_configurations 5 all-fzn/$fzn)>> /minizinc/Mistral-PIR/fz/raw-data;
        #cd all-fzn;
        echo $(./mistral-fz -t 5 --nb_configurations 5 data/some-fzn/ecp/$fzn) >> /minizinc/Mistral-PIR/fz/raw-data;
        cd data/some-fzn/ecp;
done


