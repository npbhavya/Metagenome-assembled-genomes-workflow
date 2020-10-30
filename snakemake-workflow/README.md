## Snakemake workflow 

### Install Miniconda or anaconda to your computer/cluster. 
Make sure to have conda in your system path. 

Create a conda environment
`conda create -y -n snakemake-MAG`
or 
`conda create -y -p /path/to/snakemake-MAG`

Activate the conda environment 
`source activate snakemake-MAG`

Download snakelike to the environment
`conda install snakemake`

#assembly and assembly stats
`conda install -c bioconda megahit`
`conda install -c bioconda quast`

#binning and binning stats
`conda install -c bioconda bowtie2`
`conda install -c bioconda samtools==1.9`
`conda install -c ursky metabat2`
`conda install -c bioconda checkm-genome`
 
### Runing the workflow

Add paired end Illumina reads to directory "reads" 
- For now the snakefile runs only for Illumina paired end reads 
- the input files must end with {sample}_R1.fastq, and {sample}_R2.fastq

Run the command 

First check if there are any errors, dry-run
`snakemake -s snakemake-cross-assembly -n` 

If there are no erros, then run the file 
`snakemake -s snakemake-cross-assembly -p`

### Addtional paramters that can be added 
- threads 
- memory
- running the workflow on cluster 
- adding the workflow for fasta files or compressed formats
