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
  //helpers();
  //
  // TODO : test arc
  //
  var pts = [[20,0],[0,0],[0,10]].concat(arc(10,20,0,0,7));
  var a = polygon(pts);
  //
  p2d.push(a);
  //
  // TODO : test ovoid
  //
  //pieces = utils_preproc();
  //
  var pieces = p2d;
  //
  pieces.push(utils_sat().translate([10,-10,0]));
  return pieces;
}

