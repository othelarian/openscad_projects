// can head
module monster_head(size=1,det=1,variation="mark_I") {
  // INTERNAL MODULES ################################
  // #################################################
  module coupole_bydeep(d,p,m=false,$fn=12) {
    h1 = sqrt(pow(d/2,2)+pow(p,2));
    cs1 = p/h1;
    r = h1/2/cs1;
    ang = 180-2*acos(cs1);
    dec = floor($fn/4);
    arc = [for (i=[1:dec-1]) let (ta = ang-(ang/dec)*i) [sin(ta)*r,(r-p)-(cos(ta)*r)]];
    pts = concat([[0,1],[d/2,1],[d/2,0]],arc,[[0,-p]]);
    if (m) difference() {
      translate([0,0,-(p+1)/2]) cube([d+1,d+1,p+1],center=true);
      rotate_extrude(angle=360) polygon(pts);
    }
    else intersection() {
      rotate_extrude(angle=360) polygon(pts);
    }
  }
  // #################################################
  module ring(h,i,o,$fn=12) {
    difference() {
      cylinder(h,d=o,center=true);
      cylinder((h+1),d=i,center=true);
    }
  }
  // #################################################
  det = 12*size*det;
  $fn = det;
  //
  //
  union() {
    difference() {
      translate([0,0,size*5]) cylinder(h=size*10,d=size*5,center=true);
      translate([0,0,size*10-size/2]) rotate([180,0,0]) coupole_bydeep(size*5,size/2,true,$fn=det);
      translate([0,0,size]) coupole_bydeep(size*5,size,true,$fn=det);
      translate([0,0,size*8]) ring(size/2,size*5-size*0.5,size*6,$fn=det);
      translate([size*2.5,0,size*4]) rotate([0,90,0]) cylinder(size*3,d=size*4,center=true);
      pts = [[-size*3,0],[-size,0],[-size,size*3],[-size*3,size*5]];
      translate([0,size*3,0]) rotate([90,0,0]) linear_extrude(height=size*6) polygon(pts);
    }
    translate([size*2.5-size,0,size*4]) rotate([0,-90,0]) coupole_bydeep(size*4,size,false,$fn=det);
    translate([size,0,size*4]) rotate([0,90,0]) ring(size*2,size*4,size*4.5,$fn=det);
    cylinder(size*5,d=size*3);
  }
}
