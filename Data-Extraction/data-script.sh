#Creatigng output file
rm raw-data
touch raw-data

cd all-fzn
#Looping over all instances
for fzn in *; do 

	./mistral-fz -t 10 --details --nb_configurations 10 data/example_satisfaction.fzn
	sleep 11;
	echo $(./mistral-fz -t 10 --nb_configurations 5 data/example_satisfaction.fzn)
	>> /home/rostom/Desktop/Projects/PIR---Improving-Solvers/Data-Extraction/raw-data;
	
done

