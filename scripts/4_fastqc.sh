#!/bin/bash
#SBATCH -J scte_fastqc
#SBATCH --time=24:00:00
#SBATCH --mem=40G
#SBATCH --array=48-81
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/fastqc-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/fastqc-%A-%a-%J.out

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"

sample=SRR61550${SLURM_ARRAY_TASK_ID}

source /gpfs/runtime/cbc_conda/bin/activate_cbc_conda

fastqc -o ${qc_dir}/fastqc_trimmed fastqc ${fastq_dir}/${sample}_trimmed_1P.fastq.gz
fastqc -o ${qc_dir}/fastqc_trimmed fastqc ${fastq_dir}/${sample}_trimmed_2P.fastq.gz
