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
            trucksIdx = random.sample(range(1000, 2000), i+1)
            trucksLoc = np.random.choice(locationsIdx, i+2)
            packagesIdx = random.sample(range(1, 1000), i+2)
            packagesLoc = np.random.choice(locationsIdx[1:]+trucksIdx, i+2)
            print(locationsIdx, packagesIdx, packagesLoc)
            writeProblem(j, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc)
            writeHTNProblem(j, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc)
            # writeSolution(j, packagesIdx, packagesLoc)

def writeProblem(j, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc):
    fname = 'logistics_test_set/problem{}-{}-strips.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w")
    writeHeader(file)
    writeObjects(file, locationsIdx, packagesIdx, trucksIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc)
    writeGoal(file, packagesIdx, locationsIdx)
    file.write(")\n")

def writeHTNProblem(j, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc):
    fname = 'logistics_test_set/problem{}-{}-htn.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, locationsIdx, packagesIdx, trucksIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc)
    writeHTNGoals(file, packagesIdx, locationsIdx)
    file.write(")\n")


def writeHeader(file):
    file.write("( define ( problem probname )\n")
    file.write("  ( :domain logistics )\n")
    file.write("  ( :requirements :strips :typing :equality )\n")


def writeHTNHeader(file):
    file.write("( define ( htn-problem probname )\n")
    file.write("  ( :domain logistics )\n")
    file.write("  ( :requirements :strips :htn :typing :equality )\n")

def writeObjects(file, locationsIdx, packagesIdx, truckIdx):
    file.write("  ( :objects\n")
    file.write("    c000 - city\n")
    for idx in locationsIdx:
        file.write("    l{} - location\n".format(idx))
    for idx in packagesIdx:
        file.write("    p{} - obj\n".format(idx))
    for idx in truckIdx:
        file.write("    t{} - truck\n".format(idx))
    file.write("  )\n")

def writeInit(file, locationsIdx, packagesIdx, packagesLoc, trucksIdx, trucksLoc):
    file.write("  ( :init\n")
    for idx in locationsIdx:
        file.write("    ( in-city l{} c000 )\n".format(idx))
    for i in range(len(packagesIdx)):
        if packagesLoc[i] in range(1,1000):
            file.write("    ( obj-at p{} l{} )\n".format(packagesIdx[i], packagesLoc[i]))
        else:
            file.write("    ( in-truck p{} t{} )\n".format(packagesIdx[i], packagesLoc[i]))
    for i in range(len(trucksIdx)):
        file.write("    ( truck-at t{} l{} )\n".format(trucksIdx[i], trucksLoc[i]))
    for i in range(len(packagesIdx)):
        for j in range(i):
            file.write("    ( greater-than p{} p{} )\n".format(packagesIdx[i], packagesIdx[j]))
    file.write("  )\n")

def writeGoal(file, packagesIdx, locationsIdx):
    file.write("  ( :goal\n")
    file.write("    ( and\n")
    for idx in packagesIdx:
        file.write("      ( obj-at p{} l{} )\n".format(idx, locationsIdx[0]))
    file.write("    )\n")
    file.write("  )\n")

def writeHTNGoals(file, packagesIdx, locationsIdx):
    file.write("  ( :tasks\n")
    file.write("    ( Deliver-{}Pkg p".format(len(packagesIdx)) + " p".join(map(str,packagesIdx)) + " l{} )\n".format(locationsIdx[0]))
    file.write("  )\n")

# def writeSolution(j, packagesIdx, packagesLoc):
#     fname = 'logistics_test_set/problem{}-{}-solution.plan'.format(len(packagesIdx), j)
#     file = open(fname,"w") 
#     file.write("( defplan Logistics Prob{}-{}\n".format(len(packagesIdx), j))
#     for i in range(len(packagesIdx)):
#         file.write("  ( !Drive-Truck t000-000 l000-000 l000-{} c000 )\n".format(packagesLoc[i]))
#         file.write("  ( !Load-Truck p{} t000-000 l000-{} )\n".format(packagesIdx[i], packagesLoc[i]))
#         file.write("  ( !Drive-Truck t000-000 l000-{} l000-000 c000 )\n".format(packagesLoc[i]))
#         file.write("  ( !Unload-Truck p{} t000-000 l000-000 )\n".format(packagesIdx[i]))
#     file.write(")\n")

def writeOneTask(num_pkg):
    fname = 'logistics_test_set/task_deliver{}_prec.pddl'.format(num_pkg)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks logistics-tasks )\n")
    writeTaskDeliverNPkg(file, num_pkg)
    file.write(")\n")

def writeTasks(n):
    fname = 'logistics_test_set/tasks{}_prec.pddl'.format(n+2)
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
    file.write("    ( and\n")
    for i in range(n):
        for j in range(i):
            file.write("      ( greater-than ?obj{} ?obj{} )\n".format(i+1,j+1))
    file.write("    )\n")
    file.write("    :effect\n")
    file.write("    ( and\n")
    for i in range(n):
        file.write("      ( obj-at ?obj{} ?dst )\n".format(i+1))
    file.write("    )\n")
    file.write("  )\n")

if __name__=="__main__":
    generateProblemsAndSolutions(3,50)

