// #####################################
// lamp_minion
// #####################################

// vars ################################

$fn = 12;

// helpers #############################

module polyk(pts) { linear_extrude(height=1,center=true) polygon(pts); }

module side_helper() { translate([0,-35,60]) rotate([90,0,0]) cube([60,120,1],center=true); }
module back_helper() { translate([-35,0,60]) rotate([0,90,0]) cube([120,60,1],center=true); }
module helpers() { side_helper(); back_helper(); }

// cut preview #########################

module cut_preview() {
  //
  // body
  translate([0,0,70])
  cube([24,24,60],center=true);
  //
  // thigh right
  // thigh left
  // leg right
  // leg left
  // foot right
  //translate([0,-10,2]) cube([10,10,4],center=true);
  // foot left
  //translate([0,10,2]) cube([10,10,4],center=true);
  //
  //
}

// modules #############################

module body() {
  //
  //
}

// legs modules ##############

module hip() {
  //
  // IDEA : raquette
  //
}

module foot() {
  module foot_intra_1() {
    difference() {
      union() {
        translate([-2,0,8]) rotate([90,0,0]) cube([8,6,1],center=true);
        translate([-2,0,11]) rotate([90,0,0]) cylinder(h=1,r=4,center=true);
      }
      translate([-2,0,11]) rotate([90,0,0]) cylinder(h=2,r=2,center=true);
    }
  }
  //base vars
  long_1 = 24;
  high_1 = 6;
  diff_1 = 4;
  //base coords
  pts_1 = [
  [-long_1/2,0],[long_1/2,0],
  [long_1/2,high_1-diff_1],
  [long_1/2-diff_1,high_1],
  [-(long_1/2-diff_1),high_1],
  [-long_1/2,high_1-diff_1]
  ];
  //base
  translate([0,4,0]) rotate([90,0,0]) polyk(pts_1);
  translate([0,-4,0]) rotate([90,0,0]) polyk(pts_1);
  translate([4,0,0]) rotate([90,0,90]) polyk(pts_1);
  translate([-4,0,0]) rotate([90,0,90]) polyk(pts_1);
  translate([0,4,0]) foot_intra_1();
  translate([0,-4,0]) foot_intra_1();
}

module leg() {
  //
  cube([10,10,1],center=true);
  //
}

// assembly ############################

module assembly_lamp_minion() {
  //
  // left leg
  translate([0,0,0]) {
    foot();
    //
    translate([0,0,20])
    leg();
    //
    //
  }
  //
}

//launch time ! ########################

helpers();
cut_preview();
assembly_lamp_minion();
