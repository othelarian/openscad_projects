// basic_perso.jscad ############################

// includes #####################################
//START_INC
//END_INC
// internal vars ################################

// common functions ############################

// helpers ######################################

// parts ########################################

function body() {
  //
  var obj = polygon(utils_half_ovoid(80,30,50,[3,4,3]));
  //
  return obj;
}

// bones ########################################

// outputs ######################################

helpers = function() {
  var h1 = cube({size:[1,100,140],center:[true,true,false]}).translate([-55,0,0]);
  objs.push(h1);
  var h2 = cube({size:[100,1,140],center:[true,true,false]}).translate([0,-55,0]);
  objs.push(h2);
  var h3 = cube({size:[100,100,1],center:[true,true,false]}).translate([0,0,-5]);
  objs.push(h3);
}

bones = function() {}

render = function() {
  //
  objs.push(body());
  //
}

