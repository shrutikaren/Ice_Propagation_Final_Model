#!/bin/bash

# Number of text files
TOTAL_FILES=100
# Number of lines in each text file
TOTAL_LINES=22
# Output CSV file
OUTPUT_FILE="distance.csv"

# Initialize the CSV file with column headers
echo -n > "$OUTPUT_FILE"  # Clear the output file
for ((col=1; col<=TOTAL_LINES; col++)); do
    if [ $col -eq $TOTAL_LINES ]; then
        echo "Line_$col" >> "$OUTPUT_FILE"
    else
        echo -n "Line_$col," >> "$OUTPUT_FILE"
    fi
done

# Process each text file
for ((file=1; file<=TOTAL_FILES; file++)); do
    # Input file name
    INPUT_FILE="rathepatocyte_distance_after_freezing_B400_${file}.txt"

    # Check if the file exists
    if [ ! -f "$INPUT_FILE" ]; then
        echo "Error: File $INPUT_FILE does not exist!"
        continue
    fi

    # Extract the third column for all 22 lines
    THIRD_COLUMN=$(awk -F"," '{print $3}' "$INPUT_FILE")

    # Create a single line for the CSV
    ROW=""
    LINE_COUNT=0
    while read -r value; do
        LINE_COUNT=$((LINE_COUNT + 1))
        if [ $LINE_COUNT -eq $TOTAL_LINES ]; then
            ROW="${ROW}${value}"  # Last value, no comma
        else
            ROW="${ROW}${value},"
        fi
    done <<< "$THIRD_COLUMN"

    # Append the row to the CSV file
    echo "$ROW" >> "$OUTPUT_FILE"
done

echo "CSV file created: $OUTPUT_FILE"

