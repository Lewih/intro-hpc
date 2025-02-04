#!/bin/bash
jobIDfirst=$(sbatch --parsable --job-name job_leader job_first.slurm)
sbatch --job-name job_mult_5 --export=multiplier=5 --dependency=afterok:$jobIDfirst job_depend.slurm
sbatch --job-name job_mult_10 --export=multiplier=10 --dependency=afterok:$jobIDfirst job_depend.slurm
