#!/bin/sh
sbatch -n 1 -N 1 -t 02:00:00 run_exp_curriculum.bash
sbatch -n 1 -N 1 -t 02:00:00 run_exp_original.bash
sbatch -n 1 -N 1 -t 02:00:00 run_exp_curriculum_prune.bash
sbatch -n 1 -N 1 -t 02:00:00 run_exp_original_prune.bash

