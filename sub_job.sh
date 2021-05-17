#!/usr/local_rwth/bin/zsh


# ask for 10 GB memory
#SBATCH --mem-per-cpu=10240M   #M is the default and can therefore be omitted, but could also be K(ilo)|G(iga)|T(era)


# name the job
#SBATCH --job-name=scanpy_tutorial


# declare the merged STDOUT/STDERR file
#SBATCH --output=scanpy_tutorial.txt


### begin of executable commands

source ~/.zshrc
conda activate py-scanpy

python tutorial_scanpy.py


