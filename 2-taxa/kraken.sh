#!/bin/bash
#PBS -k oe
#PBS -l nodes=1:ppn=1,vmem=50gb,walltime=2:00:00
#PBS -M YOUREMAILHERE
#PBS -m abe
#PBS -N kraken

cd PWDHERE

module load kraken/2.0.8

#Code for making a list of all the reads in the reads directory
reads=`ls 1-reads | grep "1.fastq" | sed 's/_1.fastq//g'`

for f in $reads
do 
	kraken2 --reload --db $KRAKEN_DB --paired 1-reads/"$f"_1.fastq 1-reads/"$f"_2.fastq --threads 1 --use-names --report 2-taxa/"$f"_kraken_report --output 2-taxa/"$f"_kraken.out
done

#moving the report to a new directory to generate one output 
mkdir 2-taxa/kraken_report
mv 2-taxa/*_kraken_report taxa/kraken_report/.

module unload python 
module load python/3.6.8 
export PATH=PWDHEREscripts:$PATH

python scripts/kraken-multiple-taxa.py -d 2-taxa/kraken_report/ -r F -c 2 -o 2-taxa/kraken-report-final
#just changing the format to a csv
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" 2-taxa/kraken-report-final  >2-taxa/kraken_report-final.csv
