// brick round 1x1 wo stud

// external vars #########################

// part ##################################

module brick_round_1x1_wo_stud() {
  $fn = 12;
  union() { cylinder(h=2,d=4); translate([0,0,1.5]) cylinder(h=4.5,d=5); }
}

brick_round_1x1_wo_stud();
