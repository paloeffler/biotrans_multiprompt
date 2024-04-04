#!/bin/bash

log_file="Smiles.log"
jar_file="BioTransformer3.0_20230525.jar"
output_csv="tempfile"

temp_dir=$(mktemp -d) # Create a temporary directory to store individual output files

# Iterate over each line in the SMILES.log file
while IFS= read -r smiles_line; do
	if [ -n "$smiles_line" ]; then # Skip empty lines
        	output_dir=$(mktemp -d -p "$temp_dir") # Create a temporary directory for each line
                line_number=$(grep -nF "$smiles_line" "$log_file" | cut -d: -f1)  # Get the line number
                       	for b_value in "cyp450" "ecbased" "phaseII" "hgut" "allHuman" "env"; do # Iterate over each value in the list. "superbio" excluded  
                               	output_csv_with_b="${output_csv}_${b_value}_line${line_number}.csv" # Append the value of -b and line number to the output file name
                               	java -jar "$jar_file" -k pred -b "$b_value" -ismi "$smiles_line" -ocsv "$output_dir/$output_csv_with_b" # Run the java command with the current -b value
                                      	echo "Output saved to: $output_csv_with_b"
                                      	done
                                              	fi
                                      	done < "$log_file" 
					cat "$temp_dir"/*/*.csv > "tplist.csv" # Combine all individual output files into one
                                        rm -rf "$temp_dir" # Clean up temporary directory
                                        echo "Combined output saved to: tplist.csv"
