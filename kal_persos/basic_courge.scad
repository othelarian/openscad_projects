// basic_courge.scad ###################

// uses & includes #####################

// internal vars #######################

$fn = 12;

// internal functions ##################

// internal modules ####################

module leg() {
  //
  //
}

module body() {
  translate([0,0,0]) union() {
    //
    cylinder(h=10,d=10);
    //
  }
}

// outputs #############################

module helpers() {
  translate([-60,0,50]) rotate([0,90,0]) cube([100,100,1],center=true);
  translate([0,-60,50]) rotate([90,0,0]) cube([100,100,1],center=true);
  translate([0,0,-10]) cube([100,100,1],center=true);
}

module main() {
  //
  body();
  //
  //rotate([0,0,45]) leg();
  //
}

color("red") helpers();
main();
