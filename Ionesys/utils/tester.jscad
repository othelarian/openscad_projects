// tester.jscad #################################

// includes #####################################
//START_INC

//END_INC
// internal vars ################################

// common functions #############################

// helpers ######################################

// parts ########################################

// bones ########################################

// outputs ######################################

helpers = function() {
  var sat = utils_sat().translate([10,10,0]);
  outs.push(sat);
}

bones = function() {}

render = function() {
  //
  // TODO : test ellipse
  //
  var ellipse= utils_ellipse(50,30,60,[4,8]);
  ellipse = polygon(ellipse);
  objs.push(ellipse);
  //
  /*
  // C
  objs.push(cylinder({r:5,h:1,fn:4,center:true}).translate([0,0,10]));
  // A
  objs.push(cylinder({r:5,h:1,fn:4,center:true}).translate([-50,0,10]));
  // E
  objs.push(cylinder({r:5,h:1,fn:4,center:true}).translate([0,-50,10]));
  // F
  objs.push(cylinder({r:5,h:1,fn:4,center:true}).translate([0,50,10]));
  // I
  objs.push(cylinder({r:5,h:1,fn:4,center:true}).translate([70,0,10]));
  // B
  objs.push(cylinder({r:5,h:1,fn:4,center:true}).translate([90,0,10]));
  //
  objs.push(cylinder({r:50,h:1,fn:16,center:true}).setColor([1,1,0]).translate([0,0,5]));
  //
  objs.push(cylinder({r:20,h:1,fn:16,center:true}).setColor([1,1,0]).translate([70,0,5]));
  //
  //p2d.push(polygon(pts));
  */
  //
}

