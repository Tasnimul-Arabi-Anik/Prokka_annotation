#!/bin/bash
# Run the Prokka annotation in parallel using GNU Parallel; parallel processing can make your annotation faster. This is an example of annotating some Acinetobacter genomes located in the sequence/*/ directories. After annotation, the annotated files will be in the gffs folder. In this folder, there will be multiple subfolders named after the basenames of the input FASTA files.

find sequences/*/ -type f -name "*.fna" | parallel --verbose --jobs 16 "base_name=\$(basename {} .fna); prokka --cpus 24 --prefix \"\$base_name\" --locustag acinetobacter --force --outdir gffs/\$base_name {}"



