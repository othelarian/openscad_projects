// basic_perso.jscad

// includes #####################################

// internal vars ################################
//START_INC
include("template.jscad"); //(utils/template.jscad)
//include()
//END_INC
// helpers ######################################

helpers = function() {
  var h1 = cube({size:[1,100,140],center:[true,true,false]}).translate([-55,0,0]);
  p3d.push(h1);
  var h2 = cube({size:[100,1,140],center:[true,true,false]}).translate([0,-55,0]);
  p3d.push(h2);
  var h3 = cube({size:[100,100,1],center:[true,true,false]}).translate([0,0,-5]);
  p3d.push(h3);
}

// parts ########################################

function body() {
  //
  //
}

