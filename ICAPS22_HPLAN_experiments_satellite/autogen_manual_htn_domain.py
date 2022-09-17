import random
import math
import numpy as np

domain_file = open('satellite/domain_htn.pddl')
lines = domain_file.readlines()
lines = lines[:-1]

def generateHTNDomain(num):
    for i in range(1,num):
        new_domain_file = open('satellite/domain_htn_{}.pddl'.format(i),"w")
        for line in lines:
            new_domain_file.write(line)
        for j in range(1,i+1):
            writeOneHTNDomainMethod(new_domain_file, j)
        new_domain_file.write(")")


def writeOneHTNDomainMethod(file, num_img):
    file.write("  ( :method Get-{}Image\n".format(num_img))
    file.write("    :parameters\n")
    file.write("    (\n")
    for i in range(num_img):
        file.write("      ?dir{} - direction\n".format(i))
        file.write("      ?mode{} - mode\n".format(i))
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    (\n")
    file.write("    )\n")
    file.write("    :subtasks\n")
    file.write("    (\n")
    for i in range(num_img):
        file.write("      ( Get_Image ?dir{} ?mode{} )\n".format(i,i))
    file.write("    )\n")
    file.write("  )\n")

if __name__=="__main__":
    generateHTNDomain(17)

