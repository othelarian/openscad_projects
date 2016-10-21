// basic_perso.jscad ############################

// includes #####################################
//START_INC
//END_INC
// internal vars ################################

// common functions ############################

// helpers ######################################

// parts ########################################

function eye() {
  //
  //
}

function head() {
  //
  var obj = sphere({r:20,fn:24});
  var osb = cube({size:42,center:true}).translate([0,0,-21]);
  obj = obj.subtract(osb);
  var oad = cylinder({start:[0,0,0],end:[0,0,-4],r1:20,r2:18});
  obj =  obj.union(oad);
  //
  // TODO : add eyes
  //
  //
  obj = obj.translate([4,0,90]);
  //
  return obj;
}

function body() {
  var obj = sphere({r:30,center:true,fn:24}).translate([0,0,65]);
  var osb = cube({size:[32,62,32],center:[false,true,false]});
  obj = obj.subtract(osb.translate([0,0,65]));
  //
  var oad = cylinder({start:[0,0,0],r1:30,end:[0,0,-20],r2:28,fn:24});
  obj = obj.union(oad.translate([0,0,65]));
  //
  obj = obj.translate([0,0,40]);
  return obj;
}

function hips() {
  //
  //
}

function foot() {
  //
  //var obj = cube(
  //
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
  //
  outs.push(utils_sat().translate([5,5,0]));
}

bones = function() {}

render = function() {
  objs.push(body());
  //
  objs.push(head());
  //
  //objs.push(foot());
  //
}

