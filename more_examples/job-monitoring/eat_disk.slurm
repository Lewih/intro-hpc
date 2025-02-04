#!/bin/bash
#SBATCH --job-name eat_disk
#SBATCH -A ap_course_hpc_intro
#SBATCH -t 10:00

module purge
module load calcua/2024a
module load vsc-tutorial/202203-intel-2024a

eat_disk
