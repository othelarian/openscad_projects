
// VARS ###############################

$fn = 12;
base1 = 4;
space_p = 15;
r_plan = 10;

// MODULES ############################

module plan() {
  difference() {
    cylinder(h=base1,r=r_plan*base1,center=false,$fn=24);
    for (i = [0:11]) {
      rotate([0,0,30*i])
      translate([-base1/2,r_plan*base1-base1*2,-base1/2])
      cube([base1,base1*2+base1/2,base1*2],center=false);
    }
  }
}

module top() {
  //
  difference() {
    //
    plan();
    //
  }
  //
}

module lame() {
  difference() {
    //
    cube([base1,base1*5,base1*20],center=false);
    //
    //encoches
    translate([0,0,2*base1]) rotate([0,-90,0]) translate([0,-base1/2,-base1*1.5])
    cube([base1,base1*2+base1/2,base1*2],center=false);
    translate([0,0,(2+space_p)*base1]) rotate([0,-90,0]) translate([0,-base1/2,-base1*1.5])
    cube([base1,base1*2+base1/2,base1*2],center=false);
    //
    //
  }
}

// ASSEMBLY ###########################

module assembly_001() {
  plan();
  translate([0,0,base1*space_p]) top();
  for (i = [0:11]) if (i < 12) {
    rotate([0,0,30*i])
    translate([-base1/2,r_plan*base1-4*base1,-base1*2])
    lame();
  }
  //
}

assembly_001();
