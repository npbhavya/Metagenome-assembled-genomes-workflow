# Metagenome assembled genome workflows 

## Slurm scripts to run basic QC and annotation

### Setting up a conda environement 

    conda create -n metagenome
    conda activate metagenome
    conda install -c conda-forge mamba

### Setting up packages in conda environment 


    mamba install -c bioconda prinseq-plus-plus==1.2.3
    mamba install -c bioconda kraken2 
    mamba install -c bioconda super-focus 

### Setting up the input data
** For now this workflow runs only on illumina paired end **

    #create a directory - reads 
    mkdir paired
    #drop forward and reverse reads here


    #If the reads are already on the cluster elsewherre, just symlink the data
    ln -s /home/nala/test-data raw-fastq

    #save the sample names to a file
    ls paired/ | grep "R1.fastq.gz" | sed -e 's/_R1.fastq.gz//g'  > sample-names.txt
