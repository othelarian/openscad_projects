union() {
  translate([-10,-5,0]) cube([10,10,6],center=false);
  
  pts = [[20,0],[-1,0],[0,6]];

  h = 5;
  hrp = sqrt(400+h*h);
  angarc = 180-acos(h/hrp)*2;
  r = (hrp/2)/(h/hrp);
  dec = 4;
  arc = [for (i=[1:dec]) let (ta = 90-(angarc/dec)*i) [cos(ta)*r,sin(ta)*r-(r-6)]];
  
  translate([0,5,0]) rotate([90,0,0])
    linear_extrude(height=10) polygon(concat(pts,arc));
}
