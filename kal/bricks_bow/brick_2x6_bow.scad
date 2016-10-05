// brick 2x6 bow

// external vars #########################

ext_scale = 1.0;

// internal vars #########################

hyp_bow = sqrt(425);
r_bow = (hyp_bow/2)/(5/hyp_bow);
u_bow = r_bow-6;
ang_bow = (90-acos(5/hyp_bow))*2;
echo (ang_bow);
div = 4;

pts_bow_b = [[20,1],[20,0],[-1,0],[0,6]];
pts_bow_a = [for (i=[1:div-1]) let (ang = 90-(ang_bow/div)*i) [cos(ang)*r_bow,sin(ang)*r_bow-u_bow]];
pts_bow = concat(pts_bow_b,pts_bow_a);

// part ##################################

scale([ext_scale,ext_scale,ext_scale])
union() {
  translate([-5,-5,0]) cube([10,10,6]);
  translate([5,5,0]) rotate([90,0,0]) linear_extrude(height=10) polygon(pts_bow);
}
