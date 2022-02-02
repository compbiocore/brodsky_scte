#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -J brodsky_trimmomatic
#SBATCH --array=48-81
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=joselynn_wallace@brown.edu
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/trimmomatic-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/trimmomatic-%A-%a-%J.out

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"

source /gpfs/runtime/cbc_conda/bin/activate_cbc_conda

sample_name=SRR61550${SLURM_ARRAY_TASK_ID}

trimmomatic PE  -threads 8 -trimlog ${fastq_dir}/${sample_name}.log ${fastq_dir}/${sample_name}_1.fastq.gz ${fastq_dir}/${sample_name}_2.fastq.gz -baseout ${fastq_dir}/${sample_name}_trimmed.fastq.gz ILLUMINACLIP:/gpfs/data/cbc/abrodsky/brodsky_scte/metadata/tso.fa:2:30:5
