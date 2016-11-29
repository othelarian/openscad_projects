// infos ###########################

//nb pieces : 8
//thickness : 1

// includes ########################

include <utils.scad>;

// variables #######################

ext_id = -1;
ecart_wheels = 30;
$fn = 12;
all = (ext_id < 0)? true : false;

// functions #######################

module front_wheel() {
  rotate([90,0,0]) union() {
    //
    difference() {
      cylinder(2,d=30,center=true);
      //
      cylinder(3,d=4,center=true,$fn=8);
      //
    }
    //
    //
  }
}

module back_wheel() {
  module tick() {
    points = [[6,0],[6,2],[2,4],[-2,4],[-6,2],[-6,0]];
    rotate([0,90,0]) translate([0,13,-2])
    linear_extrude(2) polygon(points);
  }
  rotate([90,0,0]) union() {
    difference() {
      union() {
        translate([0,0,3]) cylinder(2,d=30,center=true);
        translate([0,0,-3]) cylinder(2,d=30,center=true);
      }
      cylinder(10,d=4,center=true,$fn=8);
    }
    for (i = [0:11]) rotate([0,0,(i*30)]) tick();
    //
  }
}

module wheel_rotule() {
  points = [
  [6,0],[6,5.5],[2,5.5],[2,12],
  [-2,12],[-2,5.5],[-10,5.5],[-10,0]
  ];
  translate([0,23,-1]) union() {
    difference() {
      linear_extrude(2) polygon(points);
      translate([4,2,-1]) cylinder(h=4,d=2.5,center=false,$fn=8);
      translate([-4,2,-1]) cylinder(h=4,d=2.5,center=false,$fn=8);
    }
    translate([0,9.5,1])cube([8,2,6],center=true);
  }
}

module direction() {
  module rotule() {
    translate([0,25,0]) cube([2,2,9],center=true);
    translate([0,24,2.5]) cube([4,6,2],center=true);
    translate([0,24,-2.5]) cube([4,6,2],center=true);
    translate([0,20,2.5]) cube([2,4,2],center=true);
    translate([0,20,-2.5]) cube([2,4,2],center=true);
    translate([0,20,0]) cube([6,2,10],center=true);
    translate([0,20,0]) cube([2,4,2],center=true);
    translate([0,16,0]) cube([4,6,2],center=true);
    translate([0,9,0]) cube([2,10,2],center=true);
  }
  union() {
    color("blue") cube([6,10,2],center=true);
    //
    rotule();
    mirror([0,1,0]) rotule();
    //
    //
  }
}

module motor() {
  module side() {
    translate([0,9,0]) difference() {
      cube([14,2,8],center=true);
      translate([4,0,0]) cube([2,3,4],center=true);
      translate([-4,0,0]) cube([2,3,4],center=true);
    }
  }
  //
  union() {
    //
    //
    side();
    mirror([0,1,0]) side();
    //
  }
  //
}

// composing #######################

translate([30,0,0]) {
  if (tstid(0)) translate([0,ecart_wheels,0]) front_wheel();
  if (tstid(1)) translate([0,-ecart_wheels,0]) front_wheel();
  if (tstid(2)) wheel_rotule();
  if (tstid(3)) mirror([0,1,0]) wheel_rotule();
  if (tstid(4)) translate([-4,0,0]) direction();
  if (tstid(5)) translate([4,0,0]) direction();
  //
  if (tstid(6)) motor();
  //
}
if (tstid(7)) translate([-60,0,0]) back_wheel();
