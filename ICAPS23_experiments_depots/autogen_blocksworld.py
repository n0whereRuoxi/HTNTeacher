import random
import math
import numpy as np

def generateProblemsAndSolutions(num,times):
    writeOneTask(1)
    for i in range(num):
        writeOneTask(i+2)
        writeTasks(i)
        for j in range(times):
            blocksIdx = np.random.choice(range(1, 1000), i+3, replace = False)
            print(blocksIdx)
            writeProblem(j, blocksIdx)
            writeSolution(j, blocksIdx)
            writeHTNProblem(j, blocksIdx)

def writeHTNProblem(j, blocksIdx):
    fname = 'blocksworld/problem{}-{}-htn.pddl'.format(len(blocksIdx)-1, j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, blocksIdx)
    writeInit(file, blocksIdx)
    writeTasksInProblem(file, blocksIdx)
    file.write(")\n")

def writeTasksInProblem(file, blocksIdx):
    file.write("  ( :tasks\n")
    file.write("    ( Make-{}Pile b".format(len(blocksIdx)-1) + " b".join(map(str,blocksIdx[1:])) + " )\n")
    file.write("  )\n")

def writeProblem(j, blocksIdx):
    fname = 'blocksworld/problem{}-{}-strips.pddl'.format(len(blocksIdx)-1, j)
    file = open(fname,"w") 
    writeHeader(file)
    writeObjects(file, blocksIdx)
    writeInit(file, blocksIdx)
    writeGoal(file, blocksIdx)
    file.write(")\n")

def writeHTNHeader(file):
    file.write("( define ( htn-problem probname )\n")
    file.write("  ( :domain blocks4 )\n")
    file.write("  ( :requirements :strips :htn :typing :equality )\n")

def writeHeader(file):
    file.write("( define ( problem probname )\n")
    file.write("  ( :domain blocks4 )\n")
    file.write("  ( :requirements :strips :typing :equality )\n")

def writeObjects(file, blocksIdx):
    file.write("  ( :objects\n")
    for idx in blocksIdx:
        file.write("    b{} - block\n".format(idx))
    file.write("  )\n")

def writeInit(file, blocksIdx):
    file.write("  ( :init\n")
    file.write("    ( hand-empty )\n")
    file.write("    ( on-table b{} )\n".format(blocksIdx[0]))
    for i in range(len(blocksIdx)-1):
        file.write("    ( on b{} b{} )\n".format(blocksIdx[i+1], blocksIdx[i]))
    file.write("    ( clear b{} )\n".format(blocksIdx[-1]))
    file.write("  )\n")

def writeGoal(file, blocksIdx):
    file.write("  ( :goal\n")
    file.write("    ( and\n")
    file.write("      ( clear b{} )\n".format(blocksIdx[0]))
    file.write("    )\n")
    file.write("  )\n")

# def writeTasks(n, file):
#     file.write("  ( :goal\n")
#     file.write("    ( and\n")
#     for i in range(n):
#         file.write("      ( obj-at p00{} l000-000 )\n".format(i+1))
#     file.write("    )\n")
#     file.write("  )\n")

def writeSolution(j, blocksIdx):
    fname = 'blocksworld/problem{}-{}-solution.plan'.format(len(blocksIdx) - 1, j)
    file = open(fname,"w") 
    file.write("( defplan Blocks4 Prob{}-{}\n".format(len(blocksIdx) - 1, j))

    file.write("  ( !Unstack b{} b{} )\n".format(blocksIdx[-1], blocksIdx[-2]))
    file.write("  ( !Putdown b{} )\n".format(blocksIdx[-1]))
    for i in range(len(blocksIdx) - 2):
        file.write("  ( !Unstack b{} b{} )\n".format(blocksIdx[len(blocksIdx)-i-2], blocksIdx[len(blocksIdx)-i-3]))
        file.write("  ( !Stack b{} b{} )\n".format(blocksIdx[len(blocksIdx)-i-2], blocksIdx[len(blocksIdx)-i-1]))
    file.write("  ( !Unstack b{} b{} )\n".format(blocksIdx[1], blocksIdx[2]))
    file.write("  ( !Putdown b{} )\n".format(blocksIdx[1]))
    for i in range(len(blocksIdx) - 3):
        file.write("  ( !Unstack b{} b{} )\n".format(blocksIdx[i+2], blocksIdx[i+3]))
        file.write("  ( !Stack b{} b{} )\n".format(blocksIdx[i+2], blocksIdx[i+1]))
    file.write("  ( !Pickup b{} )\n".format(blocksIdx[-1]))
    file.write("  ( !Stack b{} b{} )\n".format(blocksIdx[-1], blocksIdx[-2]))
    file.write(")\n")

def writeOneTask(num_blocks):
    fname = 'blocksworld/task_Make-{}Pile.pddl'.format(num_blocks)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks Blocks4-tasks )\n")
    writeTaskMakeNPile(file, num_blocks)
    file.write(")\n")

def writeTasks(n):
    fname = 'blocksworld/tasks{}.pddl'.format(n+2)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks Blocks4-tasks )\n")
    for i in range(n+2):
        writeTaskMakeNPile(file, i+1)
    file.write(")\n")

def writeTaskMakeNPile(file, n):
    file.write("  ( :task Make-{}Pile\n".format(n))
    file.write("    :parameters\n")
    file.write("    (\n")
    for i in range(n):
        file.write("      ?b{} - block\n".format(i+1))
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    (\n")
    file.write("    )\n")
    file.write("    :effect\n")
    file.write("    ( and\n")
    file.write("      ( on-table ?b1 )\n")
    for i in range(n-1):
        file.write("      ( on ?b{} ?b{} )\n".format(i+2, i+1))
    file.write("      ( clear ?b{} )\n".format(n))
    file.write("    )\n")
    file.write("  )\n")

if __name__=="__main__":
    generateProblemsAndSolutions(50,20)
