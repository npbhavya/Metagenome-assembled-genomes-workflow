#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=1,vmem=100gb,walltime=6:00:00
#PBS -M chmacamp@iu.edu
#PBS -m abe
#PBS -N dastool

cd PWDHERE

module unload python
module load anaconda
module load dastool

Fasta_to_Scaffolds2Bin.sh -e fa -i binning/metabat_bins > binning/metabat_scaffolds2bin.tsv
Fasta_to_Scaffolds2Bin.sh -e fa -i binning/concoct_output/concoct_bins > binning/concoct_scaffolds2bin.tsv

module load diamond/0.9.13
DAS_Tool -i binning/metabat_scaffolds2bin.tsv,binning/concoct_scaffolds2bin.tsv -l metabat,concoct -c assembly/final_contigs.fa --search_engine diamond -o binning/DASToolRun1
