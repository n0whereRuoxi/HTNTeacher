import csv
import numpy as np
import matplotlib.pyplot as plt
import statistics

domains = ['zenotravel']
curriculum = [True, False]
prune = [True]
plot = ['run_time', 'number_of_methods']
for domain in domains:
    fig, axs = plt.subplots(2)

    for is_curriculum in curriculum:
        for is_prune in prune:
            with open("{}_{}{}.txt".format(domain, 'curriculum' if is_curriculum else 'original', '_prune' if is_prune else ''), newline='') as csvfile:
                raw_results = csv.reader(csvfile, delimiter=',')
                results = {}
                for row in raw_results:
                    if int(row[0]) not in results:
                        results[int(row[0])] = [[int(row[2])], [float(row[3])]]
                    else:
                        results[int(row[0])][0].append(int(row[2]))
                        results[int(row[0])][1].append(float(row[3]))
                # print(results)
                x = results.keys()
                y_number_of_methods = [ statistics.mean(results[i][0]) for i in x]
                e_number_of_methods = [ statistics.pstdev(results[i][0]) for i in x]
                y_runtime = [ statistics.mean(results[i][1]) for i in x]
                e_runtime = [ statistics.pstdev(results[i][1]) for i in x]
                # print(x)
                # print(y_number_of_methods)
                # print(e_number_of_methods)
                # print(y_runtime)
                # print(e_runtime)
                # y_number_of_methods = [0 for i in y_number_of_methods]
                axs[0].errorbar(x, y_number_of_methods, yerr=e_number_of_methods, 
                    color = '#377eb8' if is_curriculum else '#e41a1c',
                    # linewidth = '1.0' if is_prune else '1.5',
                    label="{}{}".format('Teachable-HTN-Maker' if is_curriculum else 'HTN-Maker', ', pruning' if is_prune else ''),
                    ls='-' if is_prune else '--')
                axs[1].errorbar(x, y_runtime, yerr=e_runtime, 
                    color = '#377eb8' if is_curriculum else '#e41a1c',
                    # linewidth = '1.0' if is_prune else '1.5',
                    label="{}{}".format('Teachable-HTN-Maker' if is_curriculum else 'HTN-Maker', ', pruning' if is_prune else ''),
                    ls='-' if is_prune else '--',
                    )
    fig.suptitle('zenotravel domain')
    axs[0].legend()
    axs[0].set_ylabel('Number of methods ')
    # axs[1].legend()
    axs[1].set_xlabel('Number of people')
    axs[1].set_ylabel('Run time (ms)')
    if domain == 'logistics':
        axs[0].set_yscale('log')
        axs[1].set_yscale('log')
    plt.show()