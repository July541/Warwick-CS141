import threading
import os

MAX_LECTURE_INDEX = 27
MAX_LAB_INDEX = 11

LECTURES_NAME = "./lectures"
LABS_NAME = "./labs"

def clone_files():
    for i in range(1, MAX_LECTURE_INDEX):
        if not os.path.exists("./lecture" + str(i)):
            cmd = "https://github.com/fpclass/lecture" + str(i)
            os.system("git clone " + cmd)
    for i in range(1, MAX_LAB_INDEX):
        if not os.path.exists("./lab" + str(i)):
            cmd = "https://github.com/fpclass/lab" + str(i)
            os.system("git clone " + cmd)

def copy_files():
    if not os.path.exists(LECTURES_NAME):
        os.mkdir(LECTURES_NAME)

    for i in range(1, MAX_LECTURE_INDEX):
        cmd = "cp -r ./lecture" + str(i)  + "/src " + LECTURES_NAME + "/lecture" + str(i)
        # print(cmd)
        os.system(cmd)

    if not os.path.exists(LABS_NAME):
        os.mkdir(LABS_NAME)

    for i in range(1, MAX_LAB_INDEX):
        cmd = "cp -r lab" + str(i) + " " + LABS_NAME + "/lab" + str(i)
        os.system(cmd)

def remove_files():
    for i in range(1, MAX_LECTURE_INDEX):
        cmd = "rm -rf lecture" + str(i)
        # print(cmd)
        os.system(cmd)

    for i in range(1, MAX_LAB_INDEX):
        cmd = "rm -rf lab" + str(i)
        os.system(cmd)

def remove_git_files():
    for i in range(1, MAX_LAB_INDEX):
        cmd = "rm -rf labs/lab" + str(i) + "/.git"
        os.system(cmd)
        cmd = "rm labs/lab" + str(i) + "/.gitignore"
        os.system(cmd)

def main():
    clone_files()
    copy_files()
    remove_files()
    remove_git_files()

if __name__ == '__main__':
    main()