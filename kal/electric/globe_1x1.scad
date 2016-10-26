// globe 1x1

// external vars #########################

// part ##################################

module globe_1x1() {
  $fn = 12;
  union() {
    pts_base = [[2,0],[0,-1],[0,2]];
    div = $fn/3;
    pts_arc = [for (i=[1:div-1]) let (ang = 90-(90/div)*i) [cos(ang)*2,sin(ang)*2]];
    pts = concat(pts_base,pts_arc);
    translate([0,0,2.5]) rotate([0,0,180])
    rotate_extrude(angle=360) polygon(pts);
    translate([0,0,0.5]) cylinder(h=2,d=4);
    cylinder(h=1,d=3.5);
  }
}

globe_1x1();
