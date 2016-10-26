// brick 1x1 4 side stud w holes

// external vars #########################

// part ##################################

module brick_1x1_4_side_stud_w_holes() {
  $fn = 12;
  difference() {
    union() {
      translate([-2.5,-2.5,0]) cube([5,5,6],center=false);
      for (i = [0:3]) {
        rotate([0,0,90*i]) difference() {
          translate([0,2,3.5]) rotate([-90,0,0]) cylinder(h=1.5,d=3);
          translate([0,2,3.5]) rotate([-90,0,0]) cylinder(h=1.7,d=2);
        }
      }
    }
  }
}

brick_1x1_4_side_stud_w_holes();
