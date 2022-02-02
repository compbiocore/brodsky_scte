#!/bin/bash
#SBATCH -J scte_star_generate
#SBATCH --time=24:00:00
#SBATCH --mem=40G
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -e /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte_star_generate-%A-%a-%J.err
#SBATCH -o /gpfs/data/cbc/abrodsky/brodsky_scte/logs/scte_star_generate-%A-%a-%J.out

export SINGULARITY_BINDPATH="/gpfs/home/$USER,/gpfs/scratch/$USER,/gpfs/data/cbc,/gpfs/data/shared/databases/refchef_refs"

fastq_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/fastq"
align_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/alignments"
qc_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/working/qc"
log_dir="/gpfs/data/cbc/abrodsky/brodsky_scte/logs"

singularity exec /gpfs/data/cbc/abrodsky/brodsky_scte/metadata/brodsky_scte_20220128.sif STAR  --runMode genomeGenerate --genomeDir /gpfs/data/shared/databases/refchef_refs/grch38_release98/STAR_2_7_10a --genomeFastaFiles /gpfs/data/shared/databases/refchef_refs/grch38_release98/primary/Homo_sapiens.GRCh38.dna.primary_assembly.fa

