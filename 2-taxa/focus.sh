#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=1,vmem=50gb,walltime=2:00:00
#PBS -M YOUREMAILHERE
#PBS -m abe
#PBS -N focus

cd PWDHERE

#pairing the reads 
export PATH=PWDHEREscripts:$PATH
reads=`ls 1-reads | grep "1.fastq" | sed 's/_1.fastq//g'`
mkdir 2-taxa/paired_reads
for f in $reads
do 
	scripts/pear -f 1-reads/"$f"_1.fastq -r 1-reads/"$f"_2.fastq -o 2-taxa/paired_reads/"$f"
	rm -rf 2-taxa/paired_reads/*discarded*
	rm -rf 2-taxa/paired_reads/*unassembled*
done

module unload python
module load python/3.6.8
module load focus/1.4
focus -q 2-taxa/paired_reads -o 2-taxa/focus_output --threads 1
