// #####################################
// learn 003
// #####################################

// vars ################################
// helpers #############################

module polyk(pts) { linear_extrude(height=1,center=true) polygon(pts); }

// modules #############################

module eye() {
  union() {
    rotate([0,90,0]) cylinder(h=1,r=7,center=true);
    ligne_int = 30;
    pts_1 = [
    [0,0],[0,ligne_int+4],[-2,ligne_int+6],[-4,ligne_int+6],[-4,ligne_int+12],
    [2,ligne_int+12],[6,ligne_int+8],[6,ligne_int+4],[6,0]
    ];
    translate([2,0,2])
    rotate([0,-90,90]) polyk(pts_1);
  }
}

module tophead() {
  long = 36;
  haut_1 = 7;
  haut_2 = 4;
  diff_h = haut_1 - haut_2;
  pts_1 = [
    [0,-long/2],
    [haut_2,-long/2],
    [haut_1,-(long/2-diff_h)],
    [haut_1,long/2-diff_h],
    [haut_2,long/2],
    [0,long/2]
  ];
  polyk(pts_1);
}

module mouth() {
  union() {
    pts_1 = [
    [0,0],[16,0],[16,6],[12,10],[12,14],[18,20],[18,26],
    [10,26],[4,20],[4,10],[0,6]
    ];
    translate([-20,0,8]) rotate([-90,0,0]) polyk(pts_1);
    //
    //cube();
    //
    translate([4,0,-15])
    rotate([0,90,0])
    cube([10,10,1],center=true);
    //
  }
}

// assembly ############################

module assembly_003() {
  translate([10,0,10])
  union() {
    ecart = 22;
    translate([0,-ecart/2,0]) eye();
    translate([0,ecart/2,0]) eye();
    translate([-6,0,3]) rotate([0,-90,0]) tophead();
    translate([-16,0,3]) rotate([0,-90,0]) tophead();
    translate([-26,0,3]) rotate([0,-90,0]) tophead();
    //
    mouth();
    //
  }
}

assembly_003();
