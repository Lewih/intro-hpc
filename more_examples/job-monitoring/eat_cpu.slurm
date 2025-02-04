#!/bin/bash
#SBATCH --job-name eat_cpu
#SBATCH -A ap_course_hpc_intro
#SBATCH -n 4
#SBATCH -t 10:00

module purge
module load calcua/2024a
module load vsc-tutorial/202203-intel-2024a

srun -n4 eat_cpu
