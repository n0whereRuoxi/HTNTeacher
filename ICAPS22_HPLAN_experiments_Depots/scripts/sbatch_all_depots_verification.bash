#!/bin/sh
sbatch -n 1 -N 1 --share -t 02:00:00 run_verification_depots_curriculum.bash
sbatch -n 1 -N 1 --share -t 02:00:00 run_verification_depots_original.bash
sbatch -n 1 -N 1 --share -t 02:00:00 run_verification_depots_curriculum_prune.bash
sbatch -n 1 -N 1 --share -t 02:00:00 run_verification_depots_original_prune.bash
