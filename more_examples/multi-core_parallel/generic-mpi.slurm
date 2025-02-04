#!/bin/bash
#SBATCH --job-name=MPI-demo
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=128 --cpus-per-task=1
#SBATCH --mem-per-cpu=1g

module --force purge
module load calcua/2024a
module load vsc-tutorial/202203-intel-2024a

srun mpi_hello
