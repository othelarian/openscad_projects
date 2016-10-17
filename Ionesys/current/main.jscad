// main.jscad (current folder)

// includes #####################################

include("basic_perso.jscad");
include("utils.jscad");

// internal vars ################################

var p2d = [];
var p3d = [];

// main #########################################

function main() {
  //
  helpers();
  //
  pieces = utils_preproc();
  pieces.push(utils_sat().translate([10,-10,0]));
  return pieces;
}

