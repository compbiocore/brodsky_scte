#!/bin/bash
#SBATCH -J scte_build
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH -n 16
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

#singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220128.sif scTE_build -te /gpfs/data/cbc/abrodsky/brodsky_scte/working/refs/rmsk_ens.txt -gene /gpfs/data/shared/databases/refchef_refs/grch38_release98/gtf/Homo_sapiens.GRCh38.98.gtf -g other -o ens_hg38
#singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220128.sif scTE_build -g hg38 -o ${ref_dir}/hg38
singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/scte_test/metadata/brodsky_scte_20220107.sif scTE_build -g hg38 -o ${ref_dir}/hg38
