#!/bin/bash
#SBATCH -J scte_star_map
#SBATCH --time=32:00:00
#SBATCH --mem=42G
#SBATCH --array=48-81
#SBATCH -n 16
#SBATCH -N 1
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte_star_map-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte_star_map-%A-%a-%J.out

export SINGULARITY_BINDPATH="/gpfs/home/$USER,/gpfs/scratch/$USER,/gpfs/data/cbc,/gpfs/data/shared/databases/refchef_refs/grch38_release98/STAR_2_7_10a"

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"

sample_name=SRR61550${SLURM_ARRAY_TASK_ID}

singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220128.sif STAR --runMode alignReads --readFilesCommand zcat --runThreadN 16 --soloStrand Unstranded --soloUMIdedup Exact --winAnchorMultimapNmax 100 --outSAMmultNmax 1 --outSAMtype BAM Unsorted --genomeDir /gpfs/data/shared/databases/refchef_refs/grch38_release98/STAR_2_7_10a --outFileNamePrefix ${align_dir}/${sample_name} --readFilesIn ${fastq_dir}/${sample_name}_1.fastq.gz ${fastq_dir}/${sample_name}_2.fastq.gz

