#!/bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=500m
#SBATCH --time=5:00
# submit using: sbatch get_parameter.slurm argument

echo "Hello $1."
