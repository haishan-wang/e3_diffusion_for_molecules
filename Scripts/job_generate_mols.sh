#!/bin/bash
#SBATCH --job-name=edm-baseline
#SBATCH --time=01:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=8G
#SBATCH --output=logs/edm-baseline_%A_%a.out
#SBATCH --array=0-9


date 
module load miniconda 
source activate edm-baseline
cd ..
python eval_analyze.py --model_path outputs/edm_qm9 --n_samples 1000 --seed ${SLURM_ARRAY_TASK_ID}
date