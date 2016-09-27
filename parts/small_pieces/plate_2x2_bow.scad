

union() {

  pts = [[5,0],[0,0],[0,2]];
  hrp = sqrt(29);
  //angiso = acos(2/hrp);
  angarc = 180-acos(2/hrp)*2;
  r = (hrp/2)/(2/hrp);
  arc = [for (i=[1:2]) let (ta = 90-(angarc/3)*i) [cos(ta)*r,sin(ta)*r-(hrp)]];
  //
  difference() {
    union() {
      translate([-5,-5,0]) cube([10,10,2],center=false);
      translate([0,5,2]) rotate([90,0,0])
        linear_extrude(height=10) polygon(concat(pts,arc));
      translate([-5,-5,2]) cube([5,10,2],center=false);
    }
    
    translate([-7.5,5,0]) rotate([90,0,90])
      linear_extrude(height=15) polygon([[0,2],[1,5],[-2.5,4]]);
    translate([7.5,-5,0]) rotate([90,0,-90])
      linear_extrude(height=15) polygon([[0,2],[1,5],[-2.5,4]]);
  }

  translate([-2.5,-2.5,2])
    cylinder(h=2,d=5,center=false);

  translate([-2.5,2.5,2])
    cylinder(h=2,d=5,center=false);
}