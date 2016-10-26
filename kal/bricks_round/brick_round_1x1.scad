// brick round 1x1

// external vars #########################

// part ##################################

module brick_round_1x1() {
  $fn = 12;
  union() {
    cylinder(h=2,d=4);
    translate([0,0,1.5]) cylinder(h=4.5,d=5);
    translate([0,0,5.5]) cylinder(h=1.5,d=3);
  }
}

brick_round_1x1();
