#!/bin/sh
sbatch -n 1 -N 1 -t 02:00:00 run_verification_logistics_curriculum_prune.bash
sbatch -n 1 -N 1 -t 02:00:00 run_verification_logistics_original_prune.bash
sbatch -n 1 -N 1 -t 02:00:00 run_verification_logistics_curriculum_prune_prec.bash
sbatch -n 1 -N 1 -t 02:00:00 run_verification_logistics_original_prune_prec.bash