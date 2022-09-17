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
            writeManualMethodProblem(j, locationsIdx, packagesIdx, packagesLoc)
            writeSolution(j, locationsIdx, packagesIdx, packagesLoc)

def writeProblem(j, locationsIdx, packagesIdx, packagesLoc):
    fname = 'depots/problem{}-{}-strips.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    writeHeader(file)
    writeObjects(file, locationsIdx, packagesLoc, packagesIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc)
    writeGoal(file, packagesIdx)
    file.write(")\n")

def writeHTNProblem(j, locationsIdx, packagesIdx, packagesLoc):
    fname = 'depots/problem{}-{}-htn.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, locationsIdx, packagesLoc, packagesIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc)
    writeHTNGoals(file, packagesIdx)
    file.write(")\n")

def writeManualMethodProblem(j, locationsIdx, packagesIdx, packagesLoc):
    fname = 'depots/problem{}-{}-manual-htn.pddl'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, locationsIdx, packagesLoc, packagesIdx)
    writeInit(file, locationsIdx, packagesIdx, packagesLoc)
    writeManualMethodTasks(file, packagesIdx)
    file.write(")\n")

def writeHeader(file):
    file.write("( define ( problem probname )\n")
    file.write("  ( :domain depots )\n")
    file.write("  ( :requirements :strips :typing :equality )\n")


def writeHTNHeader(file):
    file.write("( define ( htn-problem probname )\n")
    file.write("  ( :domain depots )\n")
    file.write("  ( :requirements :strips :htn :typing :equality )\n")


def writeObjects(file, locationsIdx, packagesLoc, packagesIdx):
    file.write("  ( :objects\n")
    file.write("    truck0 - truck\n")
    file.write("    pallet0 - surface\n")
    locationsIdx = np.append(locationsIdx, 0)
    for idx in locationsIdx:
        file.write("    place{} - place\n".format(idx))
        file.write("    hoist{} - hoist\n".format(idx))
    for idx in packagesIdx:
        file.write("    crate{} - surface\n".format(idx))
        file.write("    pallet{} - surface\n".format(idx))
    file.write("  )\n")

def writeInit(file, locationsIdx, packagesIdx, packagesLoc):
    file.write("  ( :init\n")
    file.write("    ( truck-at truck0 place0 )\n")
    file.write("    ( surface-at pallet0 place0 )\n")
    file.write("    ( clear pallet0 )\n")
    locationsIdx = np.append(locationsIdx, 0)
    for idx in locationsIdx:
        file.write("    ( hoist-at hoist{} place{} )\n".format(idx, idx))
        file.write("    ( available hoist{} )\n".format(idx))
    for i in range(len(packagesIdx)):
        file.write("    ( surface-at pallet{} place{} )\n".format(packagesIdx[i], packagesLoc[i]))
        file.write("    ( surface-at crate{} place{} )\n".format(packagesIdx[i], packagesLoc[i]))
        file.write("    ( on crate{} pallet{} )\n".format(packagesIdx[i], packagesIdx[i]))
        file.write("    ( is-crate crate{} )\n".format(packagesIdx[i]))
        file.write("    ( clear crate{} )\n".format(packagesIdx[i]))
    file.write("  )\n")

def writeGoal(file, packagesIdx):
    file.write("  ( :goal\n")
    file.write("    ( and\n")
    # for idx in packagesIdx:
    #     file.write("      ( obj-at p{} l000-000 )\n".format(idx))
    file.write("    )\n")
    file.write("  )\n")

def writeHTNGoals(file, packagesIdx):
    file.write("  ( :tasks\n")
    file.write("    ( Make-{}Crate pallet0 crate".format(len(packagesIdx)) + " crate".join(map(str,packagesIdx)) + " )\n")
    file.write("  )\n")

def writeManualMethodTasks(file, packagesIdx):
    file.write("  ( :tasks\n")
    file.write("    ( Make-On crate{} pallet0 )".format(packagesIdx[0]))
    for i in range(len(packagesIdx) - 1):
        file.write("    ( Make-On crate{} crate{} )".format(packagesIdx[i+1], packagesIdx[i]))
    file.write("  )\n")

def writeSolution(j, locationsIdx, packagesIdx, packagesLoc):
    fname = 'depots/problem{}-{}-solution.plan'.format(len(packagesIdx), j)
    file = open(fname,"w") 
    file.write("( defplan depots Prob{}-{}\n".format(len(packagesIdx), j))
    for i in range(len(packagesIdx)):
        file.write("  ( !Drive truck0 place0 place{} )\n".format(packagesLoc[i]))
        file.write("  ( !Lift hoist{} crate{} pallet{} place{} )\n".format(packagesLoc[i], packagesIdx[i], packagesIdx[i], packagesLoc[i]))
        file.write("  ( !Load hoist{} crate{} truck0 place{} )\n".format(packagesLoc[i], packagesIdx[i], packagesLoc[i]))
        file.write("  ( !Drive truck0 place{} place0 )\n".format(packagesLoc[i]))
        file.write("  ( !Unload hoist0 crate{} truck0 place0 )\n".format(packagesIdx[i]))
        if i == 0:
            file.write("  ( !Drop hoist0 crate{} pallet0 place0 )\n".format(packagesIdx[i]))
        else:
            file.write("  ( !Drop hoist0 crate{} crate{} place0 )\n".format(packagesIdx[i], packagesIdx[i-1]))
    file.write(")\n")

def writeOneTask(num_pkg):
    fname = 'depots/task_Make-{}Crate.pddl'.format(num_pkg)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks depots-tasks )\n")
    writeTaskMakeNCrate(file, num_pkg)
    file.write(")\n")

def writeTasks(n):
    fname = 'depots/tasks{}.pddl'.format(n+2)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks depots-tasks )\n")
    for i in range(n+2):
        writeTaskMakeNCrate(file, i+1)
    file.write(")\n")

def writeTaskMakeNCrate(file, n):
    file.write("  ( :task Make-{}Crate\n".format(n))
    file.write("    :parameters\n")
    file.write("    (\n")
    file.write("      ?p0 - surface\n")
    for i in range(n):
        file.write("      ?c{} - surface\n".format(i+1))
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    (\n")
    file.write("    )\n")
    file.write("    :effect\n")
    file.write("    ( and\n")
    file.write("      ( on ?c1 ?p0 )\n")
    for i in range(n-1):
        file.write("      ( on ?c{} ?c{} )\n".format(i+2, i+1))
    file.write("      ( clear ?c{} )\n".format(n))
    file.write("    )\n")
    file.write("  )\n")


if __name__=="__main__":
    generateProblemsAndSolutions(15,5)

