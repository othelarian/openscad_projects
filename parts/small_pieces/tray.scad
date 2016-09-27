//tray
module tray(size=1,det=1) {
  det = 12*size*det;
  $fn = det;
  difference() {
    cylinder(size,d=size*3,center=true);
    cylinder((size+1),d=size,center=true);
  }
}
