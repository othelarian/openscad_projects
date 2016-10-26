// plate round 1x1 tile

// external vars #########################

// part ##################################

module plate_round_1x1_tile() {
  $fn = 12;
  union() { cylinder(h=1,d=4); translate([0,0,0.5]) cylinder(h=1.5,d=5); }
}

plate_round_1x1_tile();
