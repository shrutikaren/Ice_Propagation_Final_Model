#!/bin/bash
touch one_file.csv
echo "Freezing_Time_Value" > one_file.csv

TOTAL=100
for i in $(seq 1 $TOTAL); do
        file=Gillespie_alpha10_rathepatocyte_22ncell_B400_simulation_${i}.txt
        line=$(head -n 1 "$file")
        echo "$line" >> one_file.csv
        echo "Completed this iteration, moving on to the next iteration accordingly ..."
done

echo "Content from all of the 100 text files are successfully completed..."
