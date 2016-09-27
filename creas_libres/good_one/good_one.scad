// ###############################################
// basic good one
// ###############################################

// variables #####################################

$fn=12;
thck = 2;
dtck = 1;

// elements ######################################

module eye() {
  union() {
    color([0.4,0.5,0,1]) cylinder(h=thck,r=7,c8enter=false);
    translate([-8,-dtck,-10])
    cube([6,thck,14],center=false);
  }
}

module forehead() {
  union() {
    translate([0,-16,0])
    cube([thck,32,6],center=false);
    //
    translate([-24,-dtck,4])
    cube([32,dtck,8],center=false);
    //
  }
}

module torso() {
  //
  //
}

// assembly ######################################

module assembly() {
  //
  // head
  //
  translate([0,0,120])
  union() {
    //
    forehead();
    translate([8,0,0]) rotate([0,90,0]) {
      translate([0,-10,0]) eye();
      translate([0,10,0]) eye();
    }
    //
  }
  //
  // torso
  //
  // arms
  //
  // hips
  //
  translate([0,0,60])
  rotate([0,90,0])
  translate([-8,-10,0])
  cube([16,20,thck],center=false);
  //
  translate([0,-20,60])
  rotate([0,90,0])
  cylinder(h=thck,r=5,center=false);
  translate([0,20,60])
  rotate([0,90,0])
  cylinder(h=thck,r=5,center=false);
  //
  // legs
  //
}

assembly();

// helpers #######################################

translate([-60,-50,0]) cube([4,100,140],center=false);
translate([50,-60,0]) rotate([0,0,90]) cube([4,100,140],center=false);
//translate([-50,-50,0]) cube([100,100,140],center=false);