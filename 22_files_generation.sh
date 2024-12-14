#!/bin/bash

TOTAL_FILES=100
LINES=22
# Remove any previous 100 CSV files if they were created 
#for i in $(seq $LINES); do
#	touch simulation_${i}_data.csv
#done

# Create 22 CSV files to store the data
#for i in $(seq 1 $LINES); do
#    touch simulation_${i}_data.csv
#done

# Go through the 100 output files performed by the simulation
for i in $(seq 1 $TOTAL_FILES); do
    input_file="rathepatocyte_freezing_time_B400_simulation_${i}.txt"
    echo "Opened file $input_file for processing..."

    # Inside each file, process each line
    for j in $(seq 1 $LINES); do
        # Extract the 5th value from the line and append it to the corresponding CSV file
        value=$(awk -F, "NR==$j {print \$5}" "$input_file")
        echo "$value" >> "simulation_${j}_data.csv"
    done

    echo "File $input_file processed..."
done

echo "All files processed successfully!"

