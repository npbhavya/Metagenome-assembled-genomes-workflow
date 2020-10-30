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
 
