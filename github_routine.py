# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import os
import subprocess

def git_push():
    project_path = 'L:/GitHub/econ_dash'
    os.chdir(project_path)

    try:
        subprocess.run(['git', 'add', '.'], check=True)
        subprocess.run(['git', 'commit', '-m', 'Automated commit of CSV files'], check=True)
        subprocess.run(['git', 'push', 'origin', 'main'], check=True)
        print("Successfully pushed to GitHub.")
    except subprocess.CalledProcessError as e:
        print("Failed to push to GitHub:", e)

git_push()
