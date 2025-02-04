#!/bin/bash


#### RESOURCE REQUEST ####
# Project account (-A)
#SBATCH --account=ap_course_hpc_intro

# Compute resources: Number of tasks (-n) - Numer of CPUs per task (-c)
# Default = 1 task, 1 cpu per task
#SBATCH --ntasks=4 --cpus-per-task=7

# Memory per cpu: leave blank if you don't need more than default
# Default depends on partition
# #SBATCH --mem-per-cpu=5g

# Walltime: maximum time a job can run before being stopped (-t)
# Default = 1:00:00 = 1 hour
#SBATCH --time=4:00:00

# Partition (-p)
# Default depends on cluster: Vaughan=zen2, Leibniz=broadwell, Breniac=sklake
#SBATCH --partition=zen3

# Faster inter-node communication: request all nodes to be connected via a single switch
# #SBATCH --switches=1

# Exclusive node access: prevent sharing of nodes with other jobs 
# !you will be charged for the full node, but you get all memory of the node despite requesting less CPUs 
#SBATCH --exclusive

# Number of nodes: max number of nodes over which resources are allocated (-N)
#SBATCH --nodes=1

# Jobname (-J)
# Default = name of the jobscript (example.slurm in this case)
#SBATCH --job-name=galaxies1234

# Redirect standard output (-o) and error (-e) (optional)
# Default = slurm-%j.out = slurm-<jobid>.out
# Default std error = same file as std out
# patterns: %x = job name, %j = job id
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j

# Mail notification: START, END, or FAIL
# Default mail address = linked to VSC-account
#SBATCH --mailtype=FAIL,END
#SBATCH --mail-user=firstname.lastname@uantwerpen.be

# Environment variables
# #SBATCH --export=MyVariable


#### ENVIRONMENT ####
# When a batch job starts execution, a number of environment variables are predefined, which include:
#      Variables explitly exported from the submission host with --export
#      Exported variables of your .bash_profile if --export=NONE is used
#      Variables defined by Slurm:
#
# SLURM_JOB_ID        The job's Slurm identifier
# SLURM_JOB_NAME      The job's name
# SLURM_NTASKS        The number of tasks allocated to the job
# SLURM_CPUS_PER_TASK The number of cpus per task
# SLURM_JOB_NODELIST  List of nodes allocated to the job
# ...

# First load the appropriate calcua module. Then, activate the appropriate software packages
module purge
module load calcua/version
module load Package1 Package2 Package3

# If you want to see which variables are defined, use this bit of code:
echo -e "\nSLURM environment variables:\n$(env | grep ^SLURM_)\n"
echo -e "VSC environment variables:\n$(env | grep ^VSC_)\n"
echo -e "EasyBuild-defined environment variables:\n$(env | egrep "EBROOT|EBVERSION" | sort)\n"


#### Actual computation ####
# Start the job, which runs in the directory in which you executed sbatch
echo Start Job
date
./your_executable <your-arguments>
echo End Job
