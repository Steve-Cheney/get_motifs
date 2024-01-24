
# get_motifs.sh

## Motif Counter and FASTA Extractor

This Bash script is designed to analyze DNA motif occurrences within a target FASTA file and generate counts of each motif found in the target FASTA file. Additionally, the script extracts sequences from the target FASTA file based on provided motifs.

### Usage

#### First time usage

If you cannot execute the script, please run the following command before running the script.

```bash
chmod +x get_motifs.sh
```
Then, run:
```bash
<path_to_script>/get_motifs.sh <motif_file> <target_fasta_file>
```

### Arguments

- `<motif_file>`: Path to the file containing DNA motifs to be analyzed. Format as below:
   ```
	ATTTTTGCA
	GGGGG
	ATGATGATG
   ...
   ```
- `<target_fasta_file>`: Path to the target FASTA file for motif analysis.

### Output

1. **Motif Counts**: The script generates a file named `motif_count.txt` containing motif occurrences in the target FASTA file within the directory the script is run in.

   Format:
   ```
   Motif : Count
   ACGT: 10
   ...
   ```

   This file is overwritten if it already exists.

2. **FASTA Extraction**: The script creates an output directory named `fasta` (or uses an existing one) and generates individual FASTA files for each motif specified in the `<motif_file>`.

   The extracted FASTA files are named `<motif>.fasta` and contain sequences from the target FASTA file that match the respective motif.

### Example

```bash
./get_motifs.sh motifs.txt target_sequence.fasta
```

### Note

- Ensure that the correct number of arguments is provided.
- Motifs in the `<motif_file>` should be listed one per line.
- 
