// courge basic
// nb parts : 9

// uses ##################################

use <../kal/bricks_special/brick_1x1_4_side_stud_w_holes.scad>;
use <../kal/electric/globe_1x1.scad>;
use <../kal/plates_round/plate_round_1x1_wo_stud.scad>;
use <../kal/plates/plate_1x2.scad>;
use <../kal/bricks_bow/plate_bow_1x4_double.scad>;

// external vars #########################

id_part = -1;

// internal modules ######################

module leg(rot) {
//module leg(rot,pieces) {
  rotate([0,0,90*rot]) translate([0,-4.5,-4]) rotate([90,0,0])
  /*
  if (pieces == 0) color("Orange") plate_1x2();
  else color("Brown") plate_bow_1x4_double();
  */
  //
  union() {
    //
    //
  }
}

// part ##################################

module parts(id_part=-1,all=false) {
  translate([0,0,14]) {
    if (id_part == 0 || all) union() {
      color("Brown") brick_1x1_4_side_stud_w_holes();
      translate([0,0,6]) color("Green") globe_1x1();
      translate([0,0,-2]) color("Lime") plate_round_1x1_wo_stud();
    }
    //
    leg(0);
    //
    /*
    rotate([0,0,45]) {
      if (id_part == 1 || all) leg(0,0);
      if (id_part == 2 || all) leg(1,0);
      if (id_part == 3 || all) leg(2,0);
      if (id_part == 4 || all) leg(3,0);
      if (id_part == 5 || all) leg(0,1);
      if (id_part == 6 || all) leg(1,1);
      if (id_part == 7 || all) leg(2,1);
      if (id_part == 8 || all) leg(3,1);
    }
    */
  }
}

if (id_part > -1) parts(id_part=id_part);
else parts(all=true);
