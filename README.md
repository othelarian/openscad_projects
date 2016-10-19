# The project

This git repository is used to keep track to all my work with CSG system.

# Installation

* install http-server: ``` npm i -g http-server  ```
* git clone this repository
* in the root, install openjscad:
  * git clone the repository: [https://github.com/Spiritdude/OpenJSCAD.org]
  * move in the OpenJSCAD.org directory
  * use: ``` make install ```
* for openscad, just install [openscad|www.openscad.org]

# Usage

## For openjscad:

* launch http-server in the root directory of this repository: ``` http-server ```
* go to [http://localhost:8080/OpenJSCAD.org]
* go to the 'Ionesys' directory and use the ion_manager.py script
* drag'n'drop the files in 'Ionesys/current'

## For openscad:

Use openscad, the official website will be more useful.

## ion_manager.py:

* without args: show the list of commands
* with 'c' or 'current' and a relative path to a file: set the current directory with the hardlink to all includes and the files, ready to use
* with 'i' or 'info': get the current file selected in current

