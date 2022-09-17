import random
import math
import numpy as np

def generateProblemsAndSolutions(num,times):
    for i in range(num):
        writeOneTask(i+1)
        writeTasks(i+1)
        for j in range(times):
            locationsIdx = random.sample(range(1, 1000), random.randint(round((i+2)/2), (i+1)*2))
            personIdx = random.sample(range(1, 1000), i+1)
            personLoc = np.random.choice(locationsIdx, i+1)
            print(locationsIdx, personIdx, personLoc)
            writeProblem(j, locationsIdx, personIdx, personLoc)
            writeHTNProblem(j, locationsIdx, personIdx, personLoc)
            writeSolution(j, personIdx, personLoc)

def writeProblem(j, locationsIdx, personIdx, personLoc):
    fname = 'zenotravel/problem{}-{}-strips.pddl'.format(len(personIdx), j)
    file = open(fname,"w") 
    writeHeader(file)
    writeObjects(file, locationsIdx, personIdx)
    writeInit(file, locationsIdx, personIdx, personLoc)
    writeGoal(file, personIdx)
    file.write(")\n")

def writeHTNProblem(j, locationsIdx, personIdx, personLoc):
    fname = 'zenotravel/problem{}-{}-htn.pddl'.format(len(personIdx), j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, locationsIdx, personIdx)
    writeInit(file, locationsIdx, personIdx, personLoc)
    writeHTNGoals(file, personIdx)
    file.write(")\n")

def writeHeader(file):
    file.write("( define ( problem probname )\n")
    file.write("  ( :domain zenotravel )\n")
    file.write("  ( :requirements :strips :typing :equality )\n")

def writeHTNHeader(file):
    file.write("( define ( htn-problem probname )\n")
    file.write("  ( :domain zenotravel )\n")
    file.write("  ( :requirements :strips :htn :typing :equality )\n")

def writeObjects(file, locationsIdx, personIdx):
    file.write("  ( :objects\n")
    file.write("    level000 - flevel\n")
    file.write("    level001 - flevel\n")
    file.write("    city000 - city\n")
    file.write("    aircraft000 - aircraft\n")
    for idx in locationsIdx:
        file.write("    city{} - city\n".format(idx))
    for idx in personIdx:
        file.write("    person{} - person\n".format(idx))
    file.write("  )\n")

def writeInit(file, locationsIdx, personIdx, personLoc):
    file.write("  ( :init\n")
    file.write("    ( next level000 level001 )\n")
    file.write("    ( aircraft-at aircraft000 city000 )\n")
    file.write("    ( fuel-level aircraft000 level000 )\n")
    for i in range(len(personIdx)):
        file.write("    ( person-at person{} city{} )\n".format(personIdx[i], personLoc[i]))
    file.write("  )\n")


def writeGoal(file, personIdx):
    file.write("  ( :goal\n")
    file.write("    ( and\n")
    for idx in personIdx:
        file.write("      ( person-at person{} city000 )\n".format(idx))
    file.write("    )\n")
    file.write("  )\n")

def writeHTNGoals(file, personIdx):
    file.write("  ( :tasks\n")
    file.write("    ( Fly-{}Ppl person".format(len(personIdx)) + " person".join(map(str,personIdx)) + " city000 )\n")
    file.write("  )\n")

def writeSolution(j, personIdx, personLoc):
    fname = 'zenotravel/problem{}-{}-solution.plan'.format(len(personIdx), j)
    file = open(fname,"w") 
    file.write("( defplan zenotravel Prob{}-{}\n".format(len(personIdx), j))
    for i in range(len(personIdx)):
        file.write("  ( !Refuel aircraft000 city000 level000 level001 )\n")
        file.write("  ( !Fly aircraft000 city000 city{} level001 level000 )\n".format(personLoc[i]))
        file.write("  ( !Refuel aircraft000 city{} level000 level001 )\n".format(personLoc[i]))
        file.write("  ( !Board person{} aircraft000 city{} )\n".format(personIdx[i], personLoc[i]))
        file.write("  ( !Fly aircraft000 city{} city000 level001 level000 )\n".format(personLoc[i]))
        file.write("  ( !Debark person{} aircraft000 city000 )\n".format(personIdx[i]))
    file.write(")\n")

def writeOneTask(num_ppl):
    fname = 'zenotravel/task_Fly-{}Ppl.pddl'.format(num_ppl)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks zenotravel-tasks )\n")
    writeTaskFlyNPpl(file, num_ppl)
    file.write(")\n")

def writeTasks(num_ppl):
    fname = 'zenotravel/tasks{}.pddl'.format(num_ppl)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks zenotravel-tasks )\n")
    for i in range(num_ppl):
        writeTaskFlyNPpl(file, i+1)
    file.write(")\n")

def writeTaskFlyNPpl(file, n):
    file.write("  ( :task Fly-{}Ppl\n".format(n))
    file.write("    :parameters\n")
    file.write("    (\n")
    for i in range(n):
        file.write("      ?p{} - person\n".format(i+1))
    file.write("      ?c - city\n")
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    (\n")
    file.write("    )\n")
    file.write("    :effect\n")
    file.write("    ( and\n")
    for i in range(n):
        file.write("      ( person-at ?p{} ?c )\n".format(i+1))
    file.write("    )\n")
    file.write("  )\n")

if __name__=="__main__":
    generateProblemsAndSolutions(12,5)

