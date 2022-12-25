import random
import os
import argparse

dir="/scratch/zt1/project/nau-lab/user/rli12314/HTNTeacher"

def GenerateTestScripts(domain, num, count):

    prec = [True, False] if domain == "logistics" else [False]
    curriculum = [True, False]
    prune = [True, False]
    for i in range(2,num+1):
        for j in range(count):
            print(i,j)
            for is_prec in prec:
                for is_curriculum in curriculum:
                    for is_prune in prune:
                        # Generate method learning scripts
                        fname = dir + '/ICAPS23_experiments_{}/scripts/run_exp_{}{}{}{}{}{}.bash'\
                            .format(domain,
                            domain,
                            '_curriculum' if is_curriculum else '_original', 
                            '_prune' if is_prune else '',
                            '_prec' if is_prec else '',
                            '_' + str(i),
                            '_' + str(j))
                        file = open(fname,"w") 
                        file.write("#!/bin/sh\n")
                        file.write(dir + "/htn-maker --partial_generalization {}{}{}--soundness_check {} {} {}".format(
                            '--drop_unneeded ' if is_prune else '--no_subsumption ', 
                            '--curriculum ' if is_curriculum else '', 
                            '--precondition ' if is_prec else '', 
                            domain,
                            i,
                            j))
                        # Generate planning test scripts
                        fname = dir + '/ICAPS23_experiments_{}/scripts/run_verification_{}{}{}{}{}{}.bash'\
                            .format(domain,
                            domain,
                            '_curriculum' if is_curriculum else '_original', 
                            '_prune' if is_prune else '',
                            '_prec' if is_prec else '',
                            '_' + str(i),
                            '_' + str(j))
                        file = open(fname,"w") 
                        file.write("#!/bin/sh\n")
                        file.write(dir + "/htn-solver2 {}{}{}-r {} {} {}".format(
                            '-c ' if is_curriculum else '',
                            '-p ' if is_prune else '',
                            '-y ' if is_prec else '',
                            domain,
                            i,
                            j))

if __name__=="__main__":
    
    argparser = argparse.ArgumentParser()
    argparser.add_argument("--domain", help="domain in ['blocksworld', 'logistcs', 'depots', 'satellite', 'zenotravel']",
                           type=str, required=True)
    argparser.add_argument("--num", help="Number of classes problems",
                           type=int, required=True)
    argparser.add_argument("--count", help="Number of runs for each combination of parameters for a problem ",
                           type=int, required=True)
    args = argparser.parse_args()
    GenerateTestScripts(args.domain, args.num, args.count)
