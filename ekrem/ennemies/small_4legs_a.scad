// infos ###########################

//nb pieces : 2

// includes ########################

include <../../lasercraft/utils.scad>;

// variables #######################

ext_id = -1;
all = (ext_id < 0)? true : false;
$fn = 12;

// functions #######################

module eye() {
  union() {
    rotate_extrude(angle=360,$fn=8)
    polygon(concat([[5.5,-1],[0,-1]],demi_arc(2,5.5,2)));
    translate([0,0,-1]) ring(14,10,3,12);
  }
}

module head() {
  union() {
    // hat
    difference() {
      translate([0,0,8])
      rotate_extrude(angle=360,$fn=10)
      polygon(concat([[24,-4],[0,-4]],demi_arc(8,24,3)));
      translate([0,0,15]) cylinder(3,d=20);
      translate([19,0,13]) cube([3,8,8],center=true);
    }
    // bloc
    rotate([0,0,45]) {
      // base
      cube(16,true);
      // neck
      translate([0,0,-14])
      linear_extrude(7)
      polygon([[4,8],[-4,8],[-8,4],[-8,-4],[-4,-8],[4,-8],[8,-4],[8,4]]);
      // connectors
      for (i= [0:3]) {
        rotate([0,0,90*i]) translate([7,0,-5]) rotate([0,90,0])
        cylinder(4,r=5,center=false,$fn=8);
      }
    }
    // eye
    translate([18,0,0]) cube([3,8,10],center=true);
    translate([18,0,-5]) rotate([0,90,0]) cylinder(3,d=8,center=true,$fn=8);
    translate([20,0,-6]) rotate([0,90,0]) eye();
  }
}

module leg() {
  union() {
    difference() {
      rotate([0,90,0]) translate([0,0,-8])
      linear_extrude(16) polygon(concat([[30,-3],[-30,-3]],arc(10,60,6)));
      translate([0,0,21]) rotate([90,0,0]) cylinder(4,r=5,center=false,$fn=8);
      translate([0,-1,0]) cube([17,8,20],center=true);
    }
    translate([0,1,0]) cube([10,6,22],center=true);
    translate([3,-3,-20]) cube([4,4,12],center=true);
    translate([-3,-3,-20]) cube([4,4,12],center=true);
  }
}

module legs() {
  for (i = [0:3]) { rotate([0,0,i*90-45]) translate([0,17,30]) leg(); } // 17->11
}

// composing #######################

if (tstid(0)) translate([0,0,56]) head();
if (tstid(1)) legs();

// zone de construction
//cube([200,200,1],true);
