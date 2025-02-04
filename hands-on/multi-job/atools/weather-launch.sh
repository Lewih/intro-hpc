#!/bin/bash

module load atools/1.5.1
sbatch --array $(arange --data data.csv) weather.slurm
