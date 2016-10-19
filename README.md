# The project

This git repository is used to keep track to all my work with CSG system.

# Installation

* install http-server: ``` npm i -g http-server  ```
* git clone this repository
* in the root, install openjscad:
  1. git clone the repository: https://github.com/Spiritdude/OpenJSCAD.org
  2. move in the OpenJSCAD.org directory
  3. use: ``` make install ```
* for openscad, just install [openscad](www.openscad.org)

# Usage

## For openjscad:

* launch http-server in the root directory of this repository: ``` http-server ```
* go to http://localhost:8080/OpenJSCAD.org
* go to the 'Ionesys' directory and use the ion_manager.py script
* drag'n'drop the files in 'Ionesys/current'

## For openscad:

Use openscad, the official website will be more useful.

## ion_manager.py:

* without args: show the list of commands
* with 'c' or 'current' and a relative path to a file: set the current directory with the hardlink to all includes and the files, ready to use
* with 'i' or 'info': get the current file selected in current

# Openjscad specials

I built several fonctionalities to help me in my work with openjscad.

## current/main.jscad

In this file, there is:

* a main function which load 3 others :
  * helpers
  * bones
  * render
* 2 arrays:
  * 'outs': every objects that don't need a scale pass
  * 'objs': every objects that will be scale before render
* a preproc function scale down by ten every objects in the 'objs' array
* 3 parameters:
  * 'render' (boolean): toggle the render function
  * 'bones' (boolean): toggle the bones function
  * 'helpers' (boolean): toggle the helpers function

## utils/utils.jscad

This file is always keep in 'current' directory, as an hardlink, because is used by 'main.jscad'. It contains several functions:

* utils_sat: generate a small gizmo to help the creation
* utils_preproc: used only by main function in 'main.jscad'
* utils_half_arc: generate a polygon with an arc from 90° to 0°, with in parameters:
  1. h: the height of the triangle form by the half arc (value apply in Y axis)
  2. w: the width of the previous triangle (value apply in X axis)
  3. oh: offset apply to the height from the center of the polygon
  4. ow: offset apply to the width from the center of the polygon
  5. n: number of fragments for the arc

TODO

## utils/template.jscad

This file contains all the basics to create a new file project, with the helpers, bones and render functions, and comments to help.

# W.I.P.

List of what I'm working on.

* ring in utils.jscad
* basic_perso.jscad

