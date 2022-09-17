import random
import math
import numpy as np

domain_file = open('depots/domain_htn_default.pddl')
lines = domain_file.readlines()
lines = lines[:-1]

def generateHTNDomain(num):
    for i in range(2,num):
        new_domain_file = open('depots/domain_htn_{}.pddl'.format(i),"w")
        for line in lines:
            new_domain_file.write(line)
        for j in range(1,i+1):
            writeOneHTNDomainMethod(new_domain_file, j)
        new_domain_file.write(")")


def writeOneHTNDomainMethod(file, num_pkg):
    file.write("  ( :method Make-{}Crate\n".format(num_pkg))
    file.write("    :parameters\n")
    file.write("    (\n")
    file.write("      ?p - surface\n")
    for i in range(num_pkg):
        file.write("      ?a{} - surface\n".format(i))
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    (\n")
    file.write("    )\n")
    file.write("    :subtasks\n")
    file.write("    (\n")
    file.write("      ( Make-On ?a0 ?p )\n")
    for i in range(num_pkg-1):
        file.write("      ( Make-On ?a{} ?a{} )\n".format(i+1,i))
    file.write("    )\n")
    file.write(")\n")

if __name__=="__main__":
    generateHTNDomain(17)

