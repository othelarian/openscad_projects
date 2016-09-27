// global variables ##################

$fn = 12;
base1 = 2;
crystal = [base1,base1/2]; //h,d

// parts #############################

module core() {
  union() {
    translate([0,0,base1*2]) difference() {
      cylinder(h=base1,r=base1,center=false);
      corr = crystal[1]/2;
      translate([-corr,-corr,-base1/4]) {
        cube([crystal[1],crystal[1],crystal[0]+base1/2],center=false);
      }
    }
    translate([0,0,base1]) difference() {
      cylinder(h=base1,r=base1,center=false);
      translate([-base1,base1*0.75,-base1/4]) {
        cube([base1*2,base1/4,base1+base1/2],center=false);
      }
      translate([0,0,base1/2]) rotate([-90,0,0]) cylinder(h=base1,d=base1/2,center=false);
    }
    cylinder(h=base1,r=base1,center=false);
  }
}

module wheel() {
  //
  //
}

module front_wheel_connector() {
  //
  //cb
  //
  //cube([],center=true);
  //
}

// ASSEMBLY ##########################

module assembly() {
  //
  translate([0,0,2*base1]) core();
  //
  //
}

assembly();
