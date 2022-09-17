import random
import math
import numpy as np

def generateProblemsAndSolutions(num,times):
    writeOneTask(1)
    for i in range(num):
        writeOneTask(i+1)
        writeTasks(i+1)
        # for j in range(times):
        #     modeIdx = random.sample(range(1, 1000), i+1)
        #     selectedDirectionIdx = random.sample(range(1, 1000), i+3)
        #     print(modeIdx, selectedDirectionIdx)
        #     writeProblem(j, modeIdx, selectedDirectionIdx)
        #     writeHTNProblem(j, modeIdx, selectedDirectionIdx)
        #     writeSolution(j, modeIdx, selectedDirectionIdx)

def writeProblem(j, modeIdx, selectedDirectionIdx):
    fname = 'satellite/problem{}-{}-strips.pddl'.format(len(modeIdx), j)
    file = open(fname,"w") 
    writeHeader(file)
    writeObjects(file, modeIdx, selectedDirectionIdx)
    writeInit(file, modeIdx, selectedDirectionIdx)
    writeGoal(file, modeIdx, selectedDirectionIdx)
    file.write(")\n")

def writeHTNProblem(j, modeIdx, selectedDirectionIdx):
    fname = 'satellite/problem{}-{}-htn.pddl'.format(len(modeIdx), j)
    file = open(fname,"w") 
    writeHTNHeader(file)
    writeObjects(file, modeIdx, selectedDirectionIdx)
    writeInit(file, modeIdx, selectedDirectionIdx)
    writeHTNTasks(file, modeIdx, selectedDirectionIdx)
    file.write(")\n")


def writeHeader(file):
    file.write("( define ( problem probname )\n")
    file.write("  ( :domain satellite )\n")
    file.write("  ( :requirements :strips :typing :equality )\n")


def writeHTNHeader(file):
    file.write("( define ( htn-problem probname )\n")
    file.write("  ( :domain satellite )\n")
    file.write("  ( :requirements :strips :htn :typing :equality )\n")

def writeObjects(file, modeIdx, selectedDirectionIdx):
    file.write("  ( :objects\n")
    file.write("    sat000 - satellite\n")
    for idx in selectedDirectionIdx:
        file.write("    dir{} - direction\n".format(idx))
    for idx in modeIdx:
        file.write("    mode{} - mode\n".format(idx))
        file.write("    inst{} - instrument\n".format(idx))
    file.write("  )\n")

def writeInit(file, modeIdx, selectedDirectionIdx):
    file.write("  ( :init\n")
    file.write("  ( power_avail sat000 )\n")
    file.write("    ( pointing sat000 dir{} )\n".format(selectedDirectionIdx[0]))
    for i in range(len(modeIdx)):
        file.write("    ( on_board inst{} sat000 )\n".format(modeIdx[i]))
        file.write("    ( supports inst{} mode{} )\n".format(modeIdx[i], modeIdx[i]))
        file.write("    ( calibration_target inst{} dir{} )\n".format(modeIdx[i], selectedDirectionIdx[1]))
        file.write("    ( not_calibrated inst{} )\n".format(modeIdx[i]))
    file.write("  )\n")

def writeGoal(file, modeIdx, selectedDirectionIdx):
    file.write("  ( :goal\n")
    file.write("    ( and\n")
    for i in range(len(modeIdx)):
        file.write("      ( have_image dir{} mode{} )\n".format(selectedDirectionIdx[i+2], modeIdx[i]))
    file.write("    )\n")
    file.write("  )\n")

def writeHTNTasks(file, modeIdx, selectedDirectionIdx):
    file.write("  ( :tasks\n")
    task = "    ( Get-{}Image".format(len(modeIdx))
    for i in range(len(modeIdx)):
        task += " dir{} mode{}".format(selectedDirectionIdx[i+2], modeIdx[i])
    task += " )\n"
    file.write(task)
    file.write("  )\n")

def writeSolution(j, modeIdx, selectedDirectionIdx):
    fname = 'satellite/problem{}-{}-solution.plan'.format(len(modeIdx), j)
    file = open(fname,"w") 
    file.write("( defplan satellite Prob{}-{}\n".format(len(modeIdx), j))
    for i in range(len(modeIdx)):
        if (i > 0): file.write("  ( !Switch_Off inst{} sat000 )\n".format(modeIdx[i-1]))
        file.write("  ( !Turn_To sat000 dir{} dir{} )\n".format(selectedDirectionIdx[1], selectedDirectionIdx[0] if i == 0 else selectedDirectionIdx[i+1]))
        file.write("  ( !Switch_On inst{} sat000 )\n".format(modeIdx[i]))
        file.write("  ( !Calibrate sat000 inst{} dir{})\n".format(modeIdx[i], selectedDirectionIdx[1]))
        file.write("  ( !Turn_To sat000 dir{} dir{})\n".format(selectedDirectionIdx[i+2], selectedDirectionIdx[1]))
        file.write("  ( !Take_Image sat000 dir{} inst{} mode{})\n".format(selectedDirectionIdx[i+2], modeIdx[i], modeIdx[i]))
    file.write(")\n")

def writeOneTask(num_pkg):
    fname = 'satellite/task_Get-{}Image_prec.pddl'.format(num_pkg)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks satellite-tasks )\n")
    writeTaskGetNImage(file, num_pkg)
    file.write(")\n")

def writeTasks(n):
    fname = 'satellite/tasks{}_prec.pddl'.format(n)
    file = open(fname,"w") 
    file.write("( define\n")
    file.write("  ( tasks satellite-tasks )\n")
    for i in range(n):
        writeTaskGetNImage(file, i+1)
    file.write(")\n")

def writeTaskGetNImage(file, n):
    file.write("  ( :task Get-{}Image_prec\n".format(n))
    file.write("    :parameters\n")
    file.write("    (\n")
    for i in range(n):
        file.write("      ?goal_dir{} - direction\n".format(i+1))
        file.write("      ?goal_mode{} - mode\n".format(i+1))
    file.write("    )\n")
    file.write("    :precondition\n")
    file.write("    ( and\n")
    for i in range(n):
        for j in range(i):
            file.write("      ( not ( = ?goal_dir{} ?goal_dir{} ) )\n".format(i+1,j+1))
    file.write("    )\n")
    file.write("    :effect\n")
    file.write("    ( and\n")
    for i in range(n):
        file.write("      ( have_image ?goal_dir{} ?goal_mode{} )\n".format(i+1,i+1))
    file.write("    )\n")
    file.write("  )\n")

if __name__=="__main__":
    generateProblemsAndSolutions(16,5)

