#!/bin/bash

#SBATCH --job-name=prinseq
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem=200G

for f in `cat ../sample-names.txt`; do 
  prinseq++ -min_len 60 -min_qual_mean 25 -ns_max_n 1 -derep 1 \
    -out_format 0 -trim_tail_left 5 -trim_tail_right 5 \
    -trim_qual_type min -trim_qual_left 30 \
    -trim_qual_right 30 -trim_qual_window 10 \
    -threads 10 \
    -out_name "$f"_prinseq \
    -fastq ../paired/"$f"_R1.fastq.gz \
    -fastq2 ../paired/"$f"_R2.fastq.gz; done 



