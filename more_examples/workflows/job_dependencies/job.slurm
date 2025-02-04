#!/bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=1g
#SBATCH --time=30:00

# DO FIRST SIMULATION
echo "10" >outputfile
sleep 300

# DO SIMULATION WITH PERTURBATION 1
multiplier=5
mkdir mult-$multiplier
cd mult-$multiplier
resultFirst=$(cat ../outputfile)
echo $(($resultFirst*$multiplier)) >outputfile
sleep 300 
cd ..

# DO SIMULATION WITH PERTURBATION 2
multiplier=10
mkdir mult-$multiplier
cd mult-$multiplier
resultFirst=$(cat ../outputfile)
echo $(($resultFirst*$multiplier)) >outputfile
sleep 300 

