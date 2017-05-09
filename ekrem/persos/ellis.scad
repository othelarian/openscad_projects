// infos ###########################

//nb pieces : 4

// includes ########################

include <../../lasercraft/utils.scad>;

// variables #######################

ext_id = -1;
all = (ext_id < 0)? true : false;
$fn = 12;

neck_head = 24;
body_neck = 4;

body_ground = 10;
neck_ground = body_neck+body_ground;
head_ground = neck_head+neck_ground;

// functions #######################

module head() {
  union() {
    // base top
    translate([0,0,4])
    rotate_extrude(angle=360,$fn=10)
    polygon(concat([[30,-4],[0,-4]],demi_arc(8,30,3)));
    translate([0,0,-2]) rotate([180,0,0])
    // base bottom
    difference() {
      rotate_extrude(angle=360,$fn=10)
      polygon(concat([[15,-3],[0,-3]],demi_arc(3,15,2)));
      translate([0,0,1.7]) cylinder(3,d=20,$fn=10);
    }
    // inverse bars
    translate([0,24,0]) cube([10,4,4],center=true);
    translate([0,-24,0]) cube([10,4,4],center=true);
    // lens
    deep = 20;
    translate([14,0,2]) rotate([0,90,0]) union() {
      difference() {
        cylinder(deep,d=16,$fn=10);
        translate([0,0,deep-1]) cylinder(2,d=12,$fn=10);
        translate([4,0,4]) cube([10,18,10],center=true);
      }
      translate([0,0,deep-1])
      rotate_extrude(angle=360,$fn=10)
      polygon(concat([[6,-1],[0,-1]],demi_arc(2,6,2)));
    }
    // memories
    translate([-22,6,-6]) cylinder(14,d=8,$fn=8);
    translate([-22,-6,-6]) cylinder(14,d=8,$fn=8);
    // antennas
    translate([-7,-11,9]) cylinder(5,d=5,$fn=6);
    translate([-7,-11,13]) cylinder(11,d=3,$fn=6);
    translate([-12,-12,8]) cylinder(9,d=4,$fn=6);
    translate([-12,-12,16]) cylinder(3,d=3,$fn=6);
    // neck atlas
    translate([0,0,-11]) neck_atlas();
  }
}

module neck_atlas() {
  union() {
    translate([0,6,0]) rotate([90,0,0]) cylinder(4,d=6,$fn=8,center=true);
    translate([0,-6,0]) rotate([90,0,0]) cylinder(4,d=6,$fn=8,center=true);
    translate([0,6,4]) cube([6,4,8],center=true);
    translate([0,-6,4]) cube([6,4,8],center=true);
    translate([-4,0,5]) cube([4,12,6],center=true);
    translate([4,0,6]) cube([2,14,4],center=true);
  }
}

module neck_base() {
  union() {
    cylinder(4,d=20,$fn=8);
    translate([-3,-4,3]) cube([6,8,10],center=false);
    translate([0,0,13]) rotate([90,0,0]) cylinder(8,d=6,$fn=8,center=true);
  }
}

module body() {
  union() {
    difference() {
      cylinder(8,d1=48,d2=44,$fn=12);
      translate([0,0,5]) cylinder(5,d=24,$fn=8);
      for (i = [0:3]) { rotate([0,0,i*90-45]) translate([0,12,8]) cube([4,4,6],center=true); }
    }
    //
    difference() {
      translate([0,0,8]) cylinder(8,d1=44,d2=40,$fn=12);
      translate([14,0,0]) rotate([0,-10,180]) translate([-10,-23,8]) cube([50,46,20],center=false);
      //
      //#cylinder();
      //
    }
    //
  }
}

module barda() {
  //
  //
}

module thigh() {
  //
  //
}

module thigh_L() {
  //
  //
}

module thigh_R() {
  //
  //
}

module leg() {
  //
  //
}

// composing #######################

if (tstid(0)) translate([0,0,head_ground]) head();
if (tstid(1)) translate([0,0,neck_ground]) neck_base();

if (tstid(2)) translate([0,0,body_ground]) body();

if (tstid(3)) translate([0,0,0]) barda();

// shoulders
// arms
// forearms
// fingers

thigh_L();

thigh_R();

// legs
// foots

// description

// barda -> gros sac montant
// body -> une seul partie, gros oeuf creusé
// legs -> séparée


// zone de construction
//cube([200,200,1],true);
