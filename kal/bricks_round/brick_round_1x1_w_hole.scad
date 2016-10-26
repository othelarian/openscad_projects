// brick round 1x1 w hole

// external vars #########################

// part ##################################

module brick_round_1x1_w_hole() {
  $fn = 12;
  difference() {
    union() {
      cylinder(h=2,d=4);
      translate([0,0,1.5]) cylinder(h=4.5,d=5);
      translate([0,0,5.5]) cylinder(h=1.5,d=3);
    }
    translate([0,0,-0.5]) cylinder(h=8,d=2);
  }
}

brick_round_1x1_w_hole();
