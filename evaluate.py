import csv
import numpy as np
import matplotlib.pyplot as plt
import statistics

dir = "./ICAPS23_experiments_"
domains = ['logistics']
modes = ['curriculum', 'original']
prune = [True, False]
plot = ['run_time', 'number_of_methods']
prec = [True, False]
for domain in domains:
    for has_prec in prec:
        for mode in modes:
            for is_prune in prune:
                for size in range(2,9):
                    for count in range(50):
                        try:
                            with open(dir + domain + "/results/methods/{}_{}{}{}_{}_{}.txt".format(
                                domain, 
                                mode, 
                                '_prune' if is_prune else '', 
                                '_prec' if has_prec else '',
                                size,
                                count
                                ), 'r') as file:
                                first_line = file.readline()
                                print(has_prec, mode, is_prune, size, count, first_line)
                        except IOError:
                            print("Warning: File does not appear to exist.")
                        else:
                            print("else what?")