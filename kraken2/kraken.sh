#!/bin/bash

#SBATCH --job-name=kraken2
#SBATCH --output=%x-%j.out.txt
#SBATCH --error=%x-%j.err.txt
#SBATCH --time=1-0
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --mem=200G

for f in `cat ../sample-names.txt`; do 
	kraken2 --db /home/user/database/kraken2db \
		--paired ../QC/"$f"_prinseq_good_out_R1.fastq ../QC/"$f"_prinseq_good_out_R2.fastq \
		--threads 16 --report-zero-counts --use-names \
		--report "$f"_kraken_report --output "$f"_kraken.out
done

#moving the report to a new directory to generate one output 
mkdir kraken_report
mv *_kraken_report kraken_report/.

export PATH=PWDHERE/scripts:$PATH

python scripts/kraken-multiple-taxa.py -d taxa/kraken_report/ -r P -c 2 -o taxa/kraken-report-phylum-final
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" taxa/kraken-report-phylum-final  >taxa/kraken_report-phylum-final.csv

python scripts/kraken-multiple-taxa.py -d taxa/kraken_report/ -r C -c 2 -o taxa/kraken-report-class-final
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" taxa/kraken-report-class-final  >taxa/kraken_report-class-final.csv

python scripts/kraken-multiple-taxa.py -d taxa/kraken_report/ -r O -c 2 -o taxa/kraken-report-order-final
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" taxa/kraken-report-order-final  >taxa/kraken_report-order-final.csv

python scripts/kraken-multiple-taxa.py -d taxa/kraken_report/ -r F -c 2 -o taxa/kraken-report-family-final
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" taxa/kraken-report-family-final  >taxa/kraken_report-family-final.csv

python scripts/kraken-multiple-taxa.py -d taxa/kraken_report/ -r G -c 2 -o taxa/kraken-report-genus-final
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" taxa/kraken-report-genus-final  >taxa/kraken_report-genus-final.csv

python scripts/kraken-multiple-taxa.py -d taxa/kraken_report/ -r S -c 2 -o taxa/kraken-report-species-final
sed -e "s/\[//g;s/\]//g;s/'//g;s|\t|,|g" taxa/kraken-report-genus-final  >taxa/kraken_report-genus-final.csv

