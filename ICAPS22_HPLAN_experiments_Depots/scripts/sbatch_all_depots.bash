#!/bin/sh
sbatch -n 1 -N 1 --share -t 00:08:00 run_exp_depots_curriculum.bash
sbatch -n 1 -N 1 --share -t 00:08:00 run_exp_depots_original.bash
sbatch -n 1 -N 1 --share -t 00:08:00 run_exp_depots_curriculum_prune.bash
sbatch -n 1 -N 1 --share -t 00:08:00 run_exp_depots_original_prune.bash

