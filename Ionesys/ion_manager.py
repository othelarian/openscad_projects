#!/usr/bin/python3

# imports #######################################

import sys
import os
from pathlib import Path
import subprocess

# default (list of commands) ####################

if len(sys.argv) == 1:
  print('list of commands :')
  print('ion_manager.py c|current file -> set current with the right project')

# c|current (set current project) ###############

elif sys.argv[1] in ['c','current']:
  # check the number of arguments
  if len(sys.argv) != 3:
    print('ERROR ! the last arg is missing.')
  # check if the new project exists
  elif not Path(sys.argv[2]).exists():
    print("ERROR ! the file you specified doesn't exists !")
  # arguments ok
  else:
    # clean the current directory
    for f in os.listdir('./current'):
      if not f in ['.gitignore','main.jscad','utils.jscad']:
        os.unlink('./current/'+f)
    # get the includes
    includes = []
    search = True
    f_base = open(sys.argv[2],'r')
    while search:
      line = f_base.readline()
      if line.startswith('include'):
        includes.append(line.split('//')[1][1:-2])
      elif line.startswith('//END_INC'):
        search = False
    f_base.close()
    # check if the includes exists
    search = True
    for f in includes:
      if not Path(f).exists():
        print('ERROR ! an include file is missing !')
        print(f)
        search = False
        continue
    # check the exitence of the utils.jscad in current directory
    if not Path('current/utils.jscad').exists():
      os.link('utils/utils.jscad','current/utils.jscad')
    # set the new project
    if search:
      lns = [[sys.argv[2],'current/current.jscad']]
      for i in includes:
        lns.append([i,'current/'+i.split('/')[-1]])
      for ln in lns:
        subprocess.run(['ln']+ln)
      f = open('current.txt','w')
      f.write(sys.argv[2])
      f.close()

# i|info (get current project) ##################

elif sys.argv[1] in ['i','info']:
  f = open('current.txt','r')
  print(f.read())
  f.close()

