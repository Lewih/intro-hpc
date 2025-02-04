#!/bin/bash

# Setup build directories
export APPTAINER_CACHEDIR=$VSC_SCRATCH/apptainer/cache
mkdir -p $APPTAINER_CACHEDIR
export APPTAINER_TMPDIR=$(mktemp -d)

# Create container
module load hpc-container-wrapper
conda-containerize new --prefix  "$VSC_SCRATCH/containers/bsoup" environment.yaml #similar for pip-containerize
