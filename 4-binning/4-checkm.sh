#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -M YOUREMAILHERE
#PBS -N bin_quality
#PBS -l nodes=1:ppn=1,vmem=500gb,walltime=6:00:00

cd PWDHERE

module load checkm/1.0.18

mkdir binning/bin_quality

#get the list of bins generated 
spades_bins=`ls binning/spades_metabat`

#CheckM
checkm tree -x fa binning/spades_metabat binning/bin_quality/checkm_tree
checkm tree_qa binning/bin_quality/checkm_tree/ -f binning/bin_quality/checkm_tree_qa
checkm lineage_set binning/bin_quality/checkm_tree binning/bin_quality/checkm_marker
checkm analyze binning/bin_quality/checkm_marker -x fa binning/spades_metabat binning/bin_quality/checkm_analyze
checkm qa binning/bin_quality/checkm_marker  binning/bin_quality/checkm_analyze > binning/bin_quality/checkm_summary
echo "CheckM done"
