// plate_bow_1x2

// external vars #########################

// part ##################################

module plate_bow_1x2() {
  $fn = 12;
  pts_base = [[10,1],[10,0],[5,0],[5,2],[0,2],[0,4]];
  hyp_bow = sqrt(109);
  r_bow = (hyp_bow/2)/(3/hyp_bow);
  u_bow = r_bow-4;
  ang_bow = (90-acos(3/hyp_bow))*2;
  div = $fn/4;
  pts_arc = [for (i=[1:div-1]) let (ang = 90-(ang_bow/div)*i) [cos(ang)*r_bow,sin(ang)*r_bow-u_bow]];
  pts = concat(pts_base,pts_arc);
  translate([-2.5,-2.5,0]) rotate([0,0,90])
  rotate([90,0,0]) linear_extrude(height=5) polygon(pts);
}

plate_bow_1x2();
