#!/bin/bash

module load hpc-container-wrapper
conda-containerize update --post-install post.sh "$VSC_SCRATCH/containers/bsoup"
