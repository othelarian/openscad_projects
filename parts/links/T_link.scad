//T link
module T_link(size=1,det=1,variation="mark_I") {
  det = 12*size*det;
  $fn = det;
  varia = 0;
  if (variation == "mark_I") { varia = 0; }
  if (variation == "mark_II") { varia = 1; } // WARNING : actually, do nothing
  //
  union() {
    translate([0,0,size*2-0.1]) cylinder(h=size+0.1,d=size,$fn=det);
    translate([0,0,size-0.05]) cylinder(h=size,d=size*1.2);
    translate([0,-(size-0.1),0]) rotate([90,0,0]) cylinder(h=size+0.1,d=size-0.1,$fn=det);
    translate([0,size-0.1,0]) rotate([-90,0,0]) cylinder(h=size+0.1,d=size-0.1,$fn=det);
    rotate([90,0,0]) cylinder(h=size*2-0.1,d=size*2,center=true,$fn=det);
    translate([0,0,size/2]) cube([size*2,size*2-0.1,size],center=true);
  }
}
