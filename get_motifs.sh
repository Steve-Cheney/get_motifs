#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <motif_file> <target_fasta_file>"
    exit 1
fi

# Assign command line arguments to variables
motifs_file="$1"
target_fasta="$2"
output_directory="fasta"
# Assign output file for motif counts
output_file="motif_count.txt"

# Use grep to search for each line in the target file and motif counts
echo "Motif : Count" >> "$output_file"
output="" # Create an empty string
while IFS= read -r line; do
    count=$(grep -o "$line" "$target_fasta" | wc -l)
    output+="$line: $count\n"
done < "$motifs_file"

# Overwrite any existing file called "motif_count.txt" with the output
echo -e "$output" | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' > "$output_file"

echo "Motif counts saved to '$output_file'."

# Create output directory if it doesn't exist
mkdir -p "$output_directory"

# Loop over motifs in the motif file
while IFS= read -r motif; do
    # Create a new FASTA file for each motif
    grep -B 1 "$motif" "$target_fasta" | sed '/--/d' > "$output_directory/${motif}.fasta"
done < "$motifs_file"

echo "FASTA extraction complete. Output files are in: $output_directory"