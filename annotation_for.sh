#!/bin/bash
#This is a bash script for annotating genomes using Prokka. This script will run using for loops, which is recommended if you have only a few cores or threads. Before running the script, you need to create a conda environment named "pangenome." You can also create any environment you prefer. In that environment, you can install Prokka. First, I created a folder named sample. My FASTA files are located in sample/*/*.fasta. I also created a second folder named annotation_prokka. After annotation, the output files will be saved with their basenames.

# Initialize Conda for the current shell session # Adjust this path if necessary
source ~/miniconda3/etc/profile.d/conda.sh 
# Activate the conda environment
conda activate pangenome

# Iterate over each .fna file in the sequences folder
for file in sample/*/*.fasta; do
    # Get the base filename without extension
    base_name=$(basename "$file" .fasta)
    
    # Run Prokka for annotation
    prokka --cpus 24 --kingdom Bacteria --prefix "$base_name" --locustag acinetobacter --outdir "annotation_prokka/$base_name" "$file"
done




