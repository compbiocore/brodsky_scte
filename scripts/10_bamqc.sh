#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -n 16
#SBATCH -N 1
#SBATCH -J brodsky_bamqc
#SBATCH --array=48-81
#SBATCH --mem=30GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=joselynn_wallace@brown.edu
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/bamqc-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/bamqc-%A-%a-%J.out

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"

source /gpfs/runtime/cbc_conda/bin/activate_cbc_conda

sample_name=SRR61550${SLURM_ARRAY_TASK_ID}

qualimap -Xmx10000M rnaseq -bam ${align_dir}/${sample_name}Aligned.out.srtd.bam -gtf /gpfs/data/shared/databases/refchef_refs/grch38_release98/gtf/Homo_sapiens.GRCh38.98.gtf -outdir ${qc_dir}/bamqc/${sample_name}

