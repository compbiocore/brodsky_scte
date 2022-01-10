#!/bin/bash
#SBATCH -J scte_build
#SBATCH --time=10:00:00
#SBATCH --mem=40G
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte_build-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte_build-%A-%a-%J.out

export SINGULARITY_BINDPATH="/gpfs/home/$USER,/gpfs/scratch/$USER,/gpfs/data/cbc"

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"
ref_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/refs"

newgrp cbcollab
cd ${ref_dir}
singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220107.sif wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_30/gencode.v30.annotation.gtf.gz
singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220107.sif wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/rmsk.txt.gz
