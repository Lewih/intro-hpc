#!/bin/bash

#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --time=10:00
#SBATCH -A ap_course_hpc_intro
#SBATCH --partition=zen2

module purge
module load calcua/2024a
module load vsc-tutorial/202203-intel-2024a

serial_hello
