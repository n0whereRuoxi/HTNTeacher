#!/bin/sh
sbatch -n 1 -N 1 --share -t 02:00:00 run_exp_satellite_curriculum.bash
sbatch -n 1 -N 1 --share -t 02:00:00 run_exp_satellite_original.bash
sbatch -n 1 -N 1 --share -t 02:00:00 run_exp_satellite_curriculum_prune.bash
sbatch -n 1 -N 1 --share -t 02:00:00 run_exp_satellite_original_prune.bash
