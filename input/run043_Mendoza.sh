#!/bin/bash
################################################
## Max cpus per node = 28
## Max memory per node = 245 GB
## opiFit runs n-1 solutions on n CPUs, which allows one CPU to control the others.
## For single-wind solutions:
## Patagonia and Cordillera runs used ~5 GB per solution, 
## which equals 135 GB total when running 27 solutions at a time.
## Himalayan runs used about 16 GB per solution, so, to fit in 245 GB, means that 
## only 15 or less solutions can be run at a time. I will try 12 solutions for the test case.
## For two-wind solutions, 20 cpus-per-task is a good estimate, especially at the start.
################################################

#SBATCH --job-name=run043_Mendoza
#SBATCH --cpus-per-task=28
#SBATCH --time=24:00:00
#SBATCH --mem=160GB
#SBATCH --partition=day

module load MATLAB/2022a
matlab -nodisplay -sd ~/project/OPI -r "opiFit_TwoWinds('run043_Mendoza/run043.run'); exit;"
