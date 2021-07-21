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

`conda install -c bioconda snakemake`

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
- the input files must end with {sample}_good_out_R1.fastq, and {sample}_good_out_R2.fastq
- Change this to {sample}_good_out_R1.fastq, based on the extensions.

### QC 
Didnt include the snakemake rule for QC

### Running the snakefile
Run the command 

First check if there are any errors, dry-run

`snakemake -s snakefile-cross-assembly-bacterial  -n` 

If there are no erros, then run the file 

`snakemake -s snakemake-cross-assembly-bacterial -p`

### Other snakemakefiles 
- snakefile-cross-assembly-bacterial: run cross assembly, builds MAGs, assesses quality of MAGs and bin contribution
- snakefile-cross-assembly-phages: run the same steps as bacterial workflow, but runs two binning tools (metabat2 and concoct), and skips checkm instead runs checkv
- snakeme-phage-bins: assesses the bins for phage/viruses using viral_verify (https://pypi.org/project/viral-verify/) and for the viral identified contigs, phage completeness is calculated using checkv (https://bitbucket.org/berkeleylab/checkv)

### Output files 

**snakefile-cross-assembly-bacterial**

- Assembled contigs saved to "assembly/megahit-assembly/final.contigs.fa"
- Assembled contigs stats saved to "assembly/megahit-quast/report.txt"
- Metabat binning output saved to "binning/metabat_bins"
- CheckM results saved to "binning/checkm_summary"
- Bin contributions saved to "contrib/bowtie2_alignment_rate.tsv" (this inlcudes overall alignment rate, sample name and bin name)


### Addtional paramters that can be added 
- threads 
- memory
- running the workflow on cluster 
- adding the workflow for fasta files or compressed formats
