import csv
import numpy as np
import matplotlib.pyplot as plt
import statistics

dir = "./ICAPS22_HPLAN_experiments_"
domains = ['zenotravel']
curriculum = [True, False]
prune = [True]
prec = [False]
plot = ['run_time', 'number_of_methods']
for domain in domains:
    fig, axs = plt.subplots(2)
    for is_curriculum in curriculum:
        for is_prune in prune:
            for has_precondition in prec:
                with open(dir + domain + "/results_with_methods/planmeta_{}_{}{}{}.txt".format(domain, 'curriculum' if is_curriculum else 'original', '_prune' if is_prune else '', '_prec' if has_precondition else ''), newline='') as csvfile:
                    raw_results = csv.reader(csvfile, delimiter=',')
                    results = {}
                    for row in raw_results:
                        if int(row[0]) not in results:
                            results[int(row[0])] = [[int(row[2])], [float(row[3])]]
                        else:
                            results[int(row[0])][0].append(int(row[2]))
                            results[int(row[0])][1].append(float(row[3]))
                    # print(results)
                    x = list(results.keys())
                    y_number_of_methods = [ statistics.mean(results[i][0]) for i in x]
                    e_number_of_methods = [ statistics.pstdev(results[i][0]) for i in x]
                    y_runtime = [ statistics.mean(results[i][1]) for i in x]
                    e_runtime = [ statistics.pstdev(results[i][1]) for i in x]
                    # print(x)
                    # print(y_number_of_methods)
                    # print(e_number_of_methods)
                    # print(y_runtime)
                    # print(e_runtime)
                    axs[0].errorbar(x, y_number_of_methods, yerr=e_number_of_methods, 
                        color = '#377eb8' if is_curriculum else '#e41a1c',
                        # lw = '1.0' if is_prune else '1.5',
                        label="{}{}{}".format('Teachable-HTN-Maker' if is_curriculum else 'HTN-Maker', ', pruned' if is_prune else '', ', prec' if has_precondition else ''),
                        ls='-' if is_prune else '--',
                        marker = 'x' if has_precondition else '',
                        alpha=0.9)
                    axs[1].errorbar(x, y_runtime, yerr=e_runtime, 
                        color = '#377eb8' if is_curriculum else '#e41a1c',
                        # lw = '1.0' if is_prune else '1.5',
                        label="{}{}{}".format('Teachable-HTN-Maker' if is_curriculum else 'HTN-Maker', ', pruned' if is_prune else '', ', prec' if has_precondition else ''),
                        ls='-' if is_prune else '--',
                        marker = 'x' if has_precondition else '',
                        alpha=0.9)
    fig.suptitle('{} domain methods evaluation'.format(domain))
    axs[0].legend()
    axs[0].set_ylabel('Plan Length')
    # axs[1].legend()
    axs[1].set_xlabel('n')
    axs[1].set_ylabel('Run time (ms)')
    plt.show()