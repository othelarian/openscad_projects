// infos ###########################

//nb pieces : 8
//thickness : 2

// includes ########################

include <utils.scad>;

// variables #######################

ext_id = -1;
$fn = 12;

ecart_wheels = 32.5;

// functions #######################

module front_wheel() {
  module tick() {
    rotate([0,90,0]) translate([0,13,2])
    slice([[8,-1],[-5,-1],[-5,3],[-2,5],[2,5],[8,1]],2);
  }
  rotate([90,0,0]) union() {
    difference() {
      rotate([0,0,18]) union() {
        translate([0,0,-2.5]) cylinder(2,d=32,center=true);
        translate([0,0,2.5]) cylinder(2,d=32,center=true);
      }
      cylinder(10,d=4,center=true,$fn=8);
    }
    for (i = [0:11]) rotate([0,0,(i*30)]) tick();
  }
}

module back_wheel() {
  module tick() {
    rotate([0,90,0]) translate([0,14,2])
    slice(mirror_x([[6,-1],[6,2],[2,4]]),2);
  }
  translate([0,0,18]) rotate([90,0,0]) union() {
    difference() {
      rotate([0,0,-4]) union() {
        translate([0,0,3]) cylinder(2,d=32,center=true);
        translate([0,0,-3]) cylinder(2,d=32,center=true);
      }
      cylinder(10,d=4,center=true,$fn=8);
      //
      //
    }
    for (i = [0:11]) rotate([0,0,(i*30)]) tick();
    //
  }
}

module back_link() {
  //
  translate([-60,0,0]) {
    //
    //color("blue")
    //cube([10,10,10],center=true);
    //
  }
}

module wheel_rotule() {
  points = mirror_x([[9,0],[9,5.5],[2,5.5],[2,17]]);
  translate([0,23,0]) union() {
    difference() {
      slice(points,2);
      translate([6,2,-1]) cylinder(h=4,d=2.5,center=false,$fn=8);
      translate([-6,2,-1]) cylinder(h=4,d=2.5,center=false,$fn=8);
    }
    translate([0,9.5,0])cube([8,2,6],center=true);
    translate([0,14.5,0])cube([8,2,6],center=true);
    //
  }
}

module direction() {
  module rotule() {
    translate([0,25,0]) cube([2,2,9],center=true);
    pts1 = mirror_x([[1,7],[3,5],[3,0],[1,0],[1,-3]]);
    translate([0,21,2.5]) slice(pts1,2);
    translate([0,21,-2.5]) slice(pts1,2);
    translate([0,20,0]) cube([6,2,10],center=true);
  }
  translate([0,0,0]) union() {
    pts = mirror_xy([[1,22],[1,19],[3,19],[3,13],[2,13],[2,5],[4,5]]);
    translate([0,0,0]) slice(pts,2);
    rotule();
    mirror([0,1,0]) rotule();
  }
}

module motor() {
  module side() {
    translate([0,9,0]) difference() {
      pts = mirror_x([
      [10,4],[10,2],[13,2],[13,0],[10,0],[10,-3],
      [8,-3],[8,-6],[6,-6],[6,-3]
      ]);
      rotate([90,0,0]) slice(pts,2);
      translate([6,0,0]) cube([4,3,3],center=true);
      translate([-6,0,0]) cube([4,3,3],center=true);
    }
  }
  union() {
    pts1 = mirror_xy([[10,11],[10,4],[13,4]]);
    translate([0,0,-4]) slice(pts1,2);
    side();
    mirror([0,1,0]) side();
    pts2 = mirror_x([[7,0],[7,2],[4,4]]);
    translate([0,3,-5]) rotate([-90,0,0]) slice(pts2,2);
    translate([0,-3,-5]) rotate([-90,0,0]) slice(pts2,2);
    pts3 = mirror_y([[-3,11],[8,11],[11,7]]);
    translate([11,0,4]) rotate([0,90,0]) slice(pts3,2);
    translate([-11,0,4]) rotate([0,90,0]) slice(pts3,2);
    //
  }
}

module chair() {
  translate([-40,0,6]) union() {
    difference() {
      cube([18,16,2],center=true);
      translate([-5.1,0,0]) cube([2.6,8,3],center=true);
    }
    rotate([0,-10,0])
    translate([-5,0,0.7]) union() {
      cube([2,8,3],center=true);
      translate([-1,-8,1.5]) cube([2,16,20],center=false);
    }
  }
}

// composing #######################

if (tstid(-1)) translate([-80,-50,-1]) cube([140,100,1],center=false);

translate([40,0,20]) {
  if (tstid(0)) translate([0,ecart_wheels,0]) front_wheel();
  if (tstid(1)) translate([0,-ecart_wheels,0]) mirror([0,1,0]) front_wheel();
  if (tstid(2)) wheel_rotule();
  if (tstid(3)) mirror([0,1,0]) wheel_rotule();
  if (tstid(4)) translate([-6,0,0]) direction();
  if (tstid(5)) translate([6,0,0]) direction();
  if (tstid(6)) union() {
    //
    motor();
    //
    chair();
    //
    back_link();
  }
}
if (tstid(7)) translate([-60,0,0]) back_wheel();
