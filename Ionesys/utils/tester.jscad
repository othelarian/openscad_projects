// tester.jscad #################################

// external vars ################################

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
  // TODO : test ovoid
  //
  //p2d.push(polygon(utils_half_ovoid(50,20,70,5)));
  var ovo = utils_half_ovoid(50,20,70,5);
  //ovo = polygon(ovo);
  //p2d.push(ovo);
  //
  // big r : 50
  // small r : 20
  // C -> I : 70
  // C
  p3d.push(cylinder({r:5,h:1,fn:4,center:true}).translate([0,0,10]));
  // A
  p3d.push(cylinder({r:5,h:1,fn:4,center:true}).translate([-50,0,10]));
  // E
  p3d.push(cylinder({r:5,h:1,fn:4,center:true}).translate([0,-50,10]));
  // F
  p3d.push(cylinder({r:5,h:1,fn:4,center:true}).translate([0,50,10]));
  // I
  p3d.push(cylinder({r:5,h:1,fn:4,center:true}).translate([70,0,10]));
  // B
  p3d.push(cylinder({r:5,h:1,fn:4,center:true}).translate([90,0,10]));
  //
  var pts = [];
  for (var i=0;i<=5;i++) {
    var tmp_ang = 180-(90/5)*i;
    pts.push([cos(tmp_ang)*50,sin(tmp_ang)*50]);
  }
  for (var i=0;i<=7;i++) {
    var tmp_ang = 90-(60/7)*i;
    pts.push([
      cos(tmp_ang)*(70+20),
      sin(tmp_ang)*90-40
    ]);
  }
  //
  //p2d.push(polygon(pts));
  //
  //
}
