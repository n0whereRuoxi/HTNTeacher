import csv
import numpy as np
import matplotlib.pyplot as plt
import statistics

dir = "./ICAPS23_experiments_"
domains = ['logistics']
modes = ['curriculum', 'original', 'minimum_manual']
prune = [True]
prec = [True]
plot = ['run_time', 'number_of_methods']
for domain in domains:
    fig, axs = plt.subplots(2)
    for mode in modes:
        for is_prune in prune:
            for has_precondition in prec:
                with open(dir + domain + "/results/planmeta_{}_{}{}{}.txt".format(domain, mode, '_prune' if is_prune else '', '_prec' if has_precondition else ''), newline='') as csvfile:
                    raw_results = csv.reader(csvfile, delimiter=',')
                    results = {}
                    for row in raw_results:
                        if int(row[0]) not in results:
                            results[int(row[0])] = [[int(row[2])], [float(row[3])]]
                        else:
                            results[int(row[0])][0].append(int(row[2]))
                            results[int(row[0])][1].append(float(row[3]))
                    print(results)
                    x = list(results.keys())
                    y_number_of_methods = [ len([1 for e in results[i][0] if e > 0])/50 for i in x]
                    e_number_of_methods = [ 0 for i in x]
                    y_runtime = [ statistics.mean(results[i][1]) for i in x]
                    e_runtime = [ statistics.pstdev(results[i][1]) for i in x]
                    # print(x)
                    # print(y_number_of_methods)
                    # print(e_number_of_methods)
                    # print(y_runtime)
                    # print(e_runtime)
                    if mode == 'curriculum':
                        color = '#377eb8'
                    elif mode == 'original':
                        color = '#e41a1c'
                    else:
                        color = 'green'

                    axs[0].errorbar(x, y_number_of_methods, yerr=e_number_of_methods, 
                        color = color,
                        # lw = '1.0' if is_prune else '1.5',
                        label="{}{}{}".format(mode, ', pruned' if is_prune else '', ', prec' if has_precondition else ''),
                        ls='-' if is_prune else '--',
                        marker = 'x' if mode == 'curriculum'  else '',
                        alpha=0.9)
                    axs[1].errorbar(x, y_runtime, yerr=e_runtime, 
                        color = color,
                        # lw = '1.0' if is_prune else '1.5',
                        label="{}{}{}".format(mode, ', pruned' if is_prune else '', ', prec' if has_precondition else ''),
                        ls='-' if is_prune else '--',
                        marker = 'x' if mode == 'curriculum' else '',
                        alpha=0.9)
    fig.suptitle('{} domain methods evaluation'.format(domain))
    axs[0].legend()
    axs[0].set_ylabel('Planning success rate')
    # axs[1].legend()
    axs[1].set_xlabel('n')
    axs[1].set_ylabel('Run time (ms)')
    plt.show()