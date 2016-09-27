// #####################################
// learn 002
// #####################################

// vars ################################

$fn = 12;

// helpers #############################

module polyk(pts) { linear_extrude(height=1,center=true) polygon(pts); }

// modules #############################

module foot() {
  pts_base = [[0,0],[0,20],[4,20],[10,10],[10,4],[6,0]];
  rotate([0,-90,0]) polyk(pts_base);
  pts_jonction = [[-4,4],[0,8],[4,8],[4,-8],[0,-8],[-4,-4]];
  translate([0,6,8]) rotate([0,-90,90]) polyk(pts_jonction);
}

module foot_link() {
  rotate([0,90,90]) union() {
    cube([6,26,1],center=true);
    translate([0,14,0]) cube([2,6,1],center=true);
    translate([0,-14,0]) cube([2,6,1],center=true);
    pts_1 = [[0,0],[0,8],[4,12],[10,12],[10,6],[8,6],[6,4],[6,0]];
    translate([3,0,-1])
    rotate([90,180,0]) union() {
      polyk(pts_1);
      translate([3,-1,0]) cube([2,4,1],center=true);
      translate([11,9,0]) rotate([0,0,90]) cube([2,4,1],center=true);
    }
  }
}

// assembly ############################

module assembly_002() {
  union() {
    for (i = [0:3]) {
      rotate([0,0,90*i]) translate([0,20,0]) foot();
      rotate([0,0,90*i+45]) translate([0,22,9]) foot_link();
      //
    }
    //
    translate([0,0,17])
    cube([40,40,1],center=true);
    //
  }
}

assembly_002();
//foot_link();