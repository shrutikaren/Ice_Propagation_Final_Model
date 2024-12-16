#!/bin/bash

# Constants
TOTAL_FILES=100
TOTAL_LINES=22
OUTPUT_FILE="simulation.csv"

# Clear the output file
> $OUTPUT_FILE

# Loop through 100 files
for i in $(seq 1 $TOTAL_FILES); do
    INPUT_FILE="rathepatocyte_freezing_time_B400_simulation_${i}.txt"
    
    # Check if the input file exists
    if [[ -f $INPUT_FILE ]]; then
        echo "Processing $INPUT_FILE ..."
        
        # Initialize a row to store extracted data
        row=""
        
        # Process 22 lines in the file
        for j in $(seq 1 $TOTAL_LINES); do
            # Extract the 5th and 6th columns
            values=$(awk -F, "NR==$j {print \$5, \$6}" "$INPUT_FILE")
            
            # Replace space with a comma to format as CSV
            values=$(echo $values | sed 's/ /,/g')
            
            # Append values to the row
            row+="$values,"
        done
        
        # Remove trailing comma and write the row to the output file
        echo "${row%,}" >> $OUTPUT_FILE
    else
        echo "File $INPUT_FILE not found, skipping..."
    fi
done

echo "All files processed successfully. Output saved to $OUTPUT_FILE."

