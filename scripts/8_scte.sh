#!/bin/bash
#SBATCH -J scte
#SBATCH --time=10:00:00
#SBATCH --mem=40G
#SBATCH --array=48-81
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte-%A-%a-%J.out

export SINGULARITY_BINDPATH="/gpfs/home/$USER,/gpfs/scratch/$USER,/gpfs/data/cbc"

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"
ref_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/refs"

newgrp cbcollab

sample_name=SRR61550${SLURM_ARRAY_TASK_ID}

cd ${ref_dir}

singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/scte_test/metadata/brodsky_scte_20220107.sif scTE -i ${align_dir}/${sample_name}Aligned.out.bam -g hg38 -o ${sample_name}_hg38 -x ${ref_dir}/hg38.exclusive.idx -UMI False -CB False --keeptmp True
