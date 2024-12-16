#!/bin/bash 

DIRECTORY=./my_output_simulations 
TOTAL=100

# This bash files focuses on taking out two of the text files from our simulation
# specific output folder so that we can take these files with us and then perform
# some kind of graphical representation. The first time will be done with Fatima's 
# code then it will be done with the newly added code to see if the graphical 
# representation is the same. 

# All of the Gillespie_alpha10_rathepatocyte_22ncell_B400.txt is stored in 
# ./my_freezing_time files. All of the rathepatocyte_freezing_time_B400.txt is placed
# in ./my_tau_simulated_files directory.
NEWDIRECTORY=./my_freezing_time
NEWDIRECTORY2=./my_tau_simulated
mkdir -p ${NEWDIRECTORY} ${NEWDIRECTORY2}
for i in $(seq 1 $TOTAL);do
	 mv ./my_output_simulations/simulation_${i}/Gillespie_alpha10_rathepatocyte_22ncell_B400.txt ./my_output_simulations/simulation_${i}/Gillespie_alpha10_rathepatocyte_22ncell_B400_simulation_${i}.txt
	 echo "Copying the text file into simulation_${i} successfully..."
	 cp -rf ./my_output_simulations/simulation_${i}/Gillespie_alpha10_rathepatocyte_22ncell_B400_simulation_${i}.txt $NEWDIRECTORY
	# rm /my_output_simulations/simulation_${i}/Gillespie_alpha10_rathepatocyte_22ncell_B400_simulation_${i}.txt

	# Rename the file to include simulation index
 	mv ./my_output_simulations/simulation_${i}/rathepatocyte_freezing_time_B400.txt ./my_output_simulations/simulation_${i}/rathepatocyte_freezing_time_B400_simulation_${i}.txt
        echo "Copy the 2nd text file into the simulation_${i} successfully ..."
        cp -rf ./my_output_simulations/simulation_${i}/rathepatocyte_freezing_time_B400_simulation_${i}.txt $NEWDIRECTORY2
       #  rm ./my_output_simulations/simulation_${i}/rathepatocyte_freezing_time_B400_${i}.txt
done

echo "Process Completed!!"
