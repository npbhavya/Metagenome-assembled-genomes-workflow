#!/bin/bash

#SBATCH --job-name=superfocus
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem=200G

for f in `cat ../sample-names.txt`: do 
superfocus -q {input.r1} -q {input.r2} -dir {params.d} -a mmseqs2 -t {threads} -n 0
