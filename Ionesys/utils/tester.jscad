// tester.jscad #################################

// external vars ################################

ini_sat.x = 10.0;
ini_sat.y = 10.0;
ini_sat.z = 0.0;

// includes #####################################
//START_INC

//END_INC
// internal vars ################################

// common functions #############################

// helpers ######################################

// parts ########################################

// bones ########################################

// outputs ######################################

helpers = function() {}

bones = function() {
  //
  //
}

render = function() {
  //
  // TODO : test arc
  //
  var pts = [[20,0],[-20,0]].concat(utils_arc(10,40,0,0,8));
  var a = polygon(pts);
  //
  p2d.push(a);
  //
  // TODO : test ovoid
  //
  //var pts = utils_half_ovoid();
  //
  //var pts
  //
  //
}

