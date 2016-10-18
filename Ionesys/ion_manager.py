#!/bin/python

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
  if len(sys.argv) != 3:
    print('ERROR ! the last arg is missing.')
  elif not Path(sys.argv[2]).exists():
    print("ERROR ! the file you specified doesn't exists !")
  else:
    for f in os.listdir('./current'):
      if not f in ['.gitignore','main.jscad','utils.jscad']:
        os.unlink('./current/'+f)
    #
    # TODO : check includes
    #
    includes = []
    #
    f_base = open(sys.argv[2],'r')
    #
    #
    #
    f_base.close()
    #
    # TODO : ln hard link all the files
    #
    # TODO : override current.txt
    #

# i|info (get current project) ##################

elif sys.argv[1] in ['i','info']:
  f = open('current.txt','r')
  print(f.read())
  f.close()

