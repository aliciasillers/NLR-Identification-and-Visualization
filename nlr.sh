#!/bin/bash
#
#SBATCH --job-name=NLR
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=NLR.out # File to which STDOUT will be written
#SBATCH --error=NLR.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=3-00:00:00

module load jdk

java -jar NLR-Annotator/NLR-Annotator-v2.1b.jar -i ../Genome/farr1.fa -x NLR-Annotator/src/mot.txt -y NLR-Annotator/src/store.txt -o nlr.out.txt -g nlr.out.gff -a nlr.motif.msa.fa -f ../Genome/farr1.fa nlrs.fa 0 -t 4
