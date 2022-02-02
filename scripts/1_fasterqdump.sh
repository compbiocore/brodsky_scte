#!/bin/bash
#SBATCH -J scte_fasterq_dump
#SBATCH --time=24:00:00
#SBATCH --mem=40G
#SBATCH --array=48-81
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/fasterq-dump-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/fasterq-dump-%A-%a-%J.out

export SINGULARITY_BINDPATH="/gpfs/home/$USER,/gpfs/scratch/$USER,/gpfs/data/cbc"

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"

sample=SRR61550${SLURM_ARRAY_TASK_ID}

singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220106.sif /home/rstudio/sratoolkit.2.11.3-ubuntu64/bin/fasterq-dump --outdir ${fastq_dir} ${sample}
gzip ${fastq_dir}/${sample}_1.fastq
gzip ${fastq_dir}/${sample}_2.fastq
