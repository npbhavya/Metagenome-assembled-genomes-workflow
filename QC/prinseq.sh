#!/bin/bash

#SBATCH --job-name=prinseq
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
for f in `cat ../sample-names.txt`; do 
prinseq++ -min_len 60 -min_qual_mean 25 -ns_max_n 1 -derep 1 \
    -out_format 0 -trim_tail_left 5 -trim_tail_right 5 \
    -ns_max_n 5  -trim_qual_type min -trim_qual_left 30 \
    -trim_qual_right 30 -trim_qual_window 10 \
    -threads 10 \
    -out_name "$f"_prinseq \
    -out_bad /dev/null \
    -out_bad2 /dev/null \
    -fastq ../raw-fastq/"$f"_R1_001.fastq.gz \
    -fastq2 ../raw-fastq/"$f"_R2_001.fastq.gz; done 



