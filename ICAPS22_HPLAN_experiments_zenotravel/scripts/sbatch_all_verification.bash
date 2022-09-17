#!/bin/sh
sbatch -n 1 -N 1 -t 02:00:00 run_verification_curriculum_prune.bash
sbatch -n 1 -N 1 -t 02:00:00 run_verification_original_prune.bash
