#!/bin/bash
#SBATCH --job-name eat_mem
#SBATCH -A ap_course_hpc_intro
#SBATCH -N 1
#SBATCH -t 20:00

module purge
module load calcua/2024a
module load vsc-tutorial/202203-intel-2024a

eat_mem 100
