import random
import math
import numpy as np

def generateProblemsAndSolutions(num,times):
    writeOneTask(1)
    for i in range(num):
        writeOneTask(i+2)
        writeTasks(i)
        for j in range(times):
            locationsIdx = random.sample(range(1, 1000), random.randint(round((i+2)/2), (i+2)*2))
            packagesIdx = random.sample(range(1, 1000), i+2)
            packagesLoc = np.random.choice(locationsIdx, i+2)
            print(locationsIdx, packagesIdx, packagesLoc)
            writeProblem(j, locationsIdx, packagesIdx, packagesLoc)
            writeHTNProblem(j, locationsIdx, packagesIdx, packagesLoc)
            writeSolution(j, packagesIdx, packagesLoc)

def writeProblem(j, locationsIdx, packagesIdx, packagesLoc):
    fname = 'logistics/problem{}-{}-strips.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    writeHeader(file)
    writeObjects(file, locationsIdx, packagesIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc)
    writeGoal(file, packagesIdx)
    file.write(")\n")

def writeHTNProblem(j, locationsIdx, packagesIdx, packagesLoc):
    fname = 'logistics/problem{}-{}-htn.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, locationsIdx, packagesIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc)
    writeHTNGoals(file, packagesIdx)
    file.write(")\n")


def writeHeader(file):
    file.write("( define ( problem probname )\n")
    file.write("  ( :domain logistics )\n")
    file.write("  ( :requirements :strips :typing :equality )\n")


def writeHTNHeader(file):
    file.write("( define ( htn-problem probname )\n")
    file.write("  ( :domain logistics )\n")
    file.write("  ( :requirements :strips :htn :typing :equality )\n")


def writeObjects(file, locationsIdx, packagesIdx):
    file.write("  ( :objects\n")
    file.write("    c000 - city\n")
    file.write("    t000-000 - truck\n")
    file.write("    l000-000 - location\n")
    for idx in locationsIdx:
        file.write("    l000-{} - location\n".format(idx))
    for idx in packagesIdx:
        file.write("    p{} - obj\n".format(idx))
    file.write("  )\n")

def writeInit(file, locationsIdx, packagesIdx, packagesLoc):
    file.write("  ( :init\n")
    file.write("    ( in-city l000-000 c000 )\n")
    file.write("    ( airport l000-000 )\n")
    file.write("    ( truck-at t000-000 l000-000 )\n")
    for idx in locationsIdx:
        file.write("    ( in-city l000-{} c000 )\n".format(idx))
    for i in range(len(packagesIdx)):
        file.write("    ( obj-at p{} l000-{} )\n".format(packagesIdx[i], packagesLoc[i]))
    file.write("  )\n")

def writeGoal(file, packagesIdx):
    file.write("  ( :goal\n")
    file.write("    ( and\n")
    for idx in packagesIdx:
        file.write("      ( obj-at p{} l000-000 )\n".format(idx))
    file.write("    )\n")
    file.write("  )\n")

def writeHTNGoals(file, packagesIdx):
    file.write("  ( :tasks\n")
    file.write("    ( Deliver-{}Pkg p".format(len(packagesIdx)) + " p".join(map(str,packagesIdx)) + " l000-000 )\n")
    file.write("  )\n")

def writeSolution(j, packagesIdx, packagesLoc):
    fname = 'logistics/problem{}-{}-solution.plan'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    file.write("( defplan Logistics Prob{}-{}\n".format(len(packagesIdx), j))
    for i in range(len(packagesIdx)):
        file.write("  ( !Drive-Truck t000-000 l000-000 l000-{} c000 )\n".format(packagesLoc[i]))
        file.write("  ( !Load-Truck p{} t000-000 l000-{} )\n".format(packagesIdx[i], packagesLoc[i]))
        file.write("  ( !Drive-Truck t000-000 l000-{} l000-000 c000 )\n".format(packagesLoc[i]))
        file.write("  ( !Unload-Truck p{} t000-000 l000-000 )\n".format(packagesIdx[i]))
    file.write(")\n")

def writeOneTask(num_pkg):
    fname = 'logistics/task_deliver{}.pddl'.format(num_pkg)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks logistics-tasks )\n")
    writeTaskDeliverNPkg(file, num_pkg)
    file.write(")\n")

def writeTasks(n):
    fname = 'logistics/tasks{}.pddl'.format(n+2)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks logistics-tasks )\n")
    for i in range(n+2):
        writeTaskDeliverNPkg(file, i+1)
    file.write(")\n")

def writeTaskDeliverNPkg(file, n):
    file.write("  ( :task Deliver-{}Pkg\n".format(n))
    file.write("    :parameters\n")
    file.write("    (\n")
    for i in range(n):
        file.write("      ?obj{} - obj\n".format(i+1))
    file.write("      ?dst - location\n")
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    (\n")
    file.write("    )\n")
    file.write("    :effect\n")
    file.write("    ( and\n")
    for i in range(n):
        file.write("      ( obj-at ?obj{} ?dst )\n".format(i+1))
    file.write("    )\n")
    file.write("  )\n")

if __name__=="__main__":
    generateProblemsAndSolutions(12,20)

