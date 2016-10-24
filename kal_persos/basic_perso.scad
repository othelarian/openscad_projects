// ovoid_prso.scad #####################

// uses & includes #####################

function arc(h,w,n) =
  let (hyp = sqrt(h*h+w*w),r = (hyp/2) / (h/hyp),ang = (90-acos(h/hyp))*2)
  [for (i=[0:n]) let (tmp = 90-(ang/n)*i) [cos(tmp)*r,sin(tmp)*r-(r-h)]]
;

// internal modules ####################

module head() {
  //vars
  d = 38;
  e = 8;
  ee = 7;
  //internal moduless
  module eye() {
    union() {
      difference() {
        translate([0,0,0]) rotate([0,-90,0])
        cylinder(h=8,d1=e-1,d2=e,$fn=12,center=false);
        translate([1,0,0]) rotate([0,-90,0])
        cylinder(h=2,d=e-2,$fn=12,center=false);
      }
      //
      translate([-1,0,0])
      rotate([0,90,0])
      rotate_extrude(angle=360,$fn=12)
      polygon(concat([[0,-1]],arc(2,(e-2)/2,3)));
      //
    }
  }
  //outputs
  translate([2,0,112])
  union() {
    rotate_extrude(angle=360,$fn=12) polygon(concat([[0,0]],arc(d/2-2,d/2,4)));
    translate([0,0,-3]) cylinder(h=3,d1=d-4,d2=d,$fn=12,center=false);
    //
    translate([18,0,6]) {
      //
      translate([0,ee,0]) rotate([0,0,10]) eye();
      translate([0,-ee,0]) rotate([0,0,-10]) eye();
      //
    }
  }
}

module body() {
  //vars
  d = 50;
  //internal modules
  module shoulder() {
    rotate_extrude(angle=360,$fn=12)
    translate([8,0,0]) polygon(concat([[0,0]],arc(10,6,3)));
  }
  //outputs
  translate([0,0,110])
  union() {
    difference() {
      union() {
        difference () {
          rotate_extrude(angle=360,$fn=12) polygon(concat([[0,0]],arc(20,d/2,5)));
          translate([15,0,0]) rotate([90,0,180])
          linear_extrude(height=60,center=true) polygon([[-20,0],[-20,21],[60,20],[0,0],[0,-1]]);
        }
        translate([0,0,-8]) cylinder(h=8,d1=d+4,d2=d,$fn=12,center=false);
        translate([0,0,-20]) cylinder(h=12,d=d+4,$fn=12,center=false);
        //
        translate([0,0,-34]) cylinder(h=14,d1=d,d2=d+4,$fn=12,center=false);
        //
      }
      //
      translate([2,0,-4])
      rotate_extrude(angle=360,$fn=12)
      polygon([[0,0],[36/2,0],[40/2,4],[40/2,20],[0,20]]);
      //
      //
    }
    translate([0,0,-16]) {
      sh_e = 20;
      translate([0,sh_e,0]) rotate([-90,0,0]) shoulder();
      translate([0,-sh_e,0]) rotate([90,0,0]) shoulder();
    }
    //
    //
  }
}

// outputs #############################

module helpers() {
  translate([-60,0,70]) rotate([0,90,0]) cube([140,100,1],center=true);
  translate([0,-60,70]) rotate([90,0,0]) cube([100,140,1],center=true);
  translate([0,0,-10]) cube([100,100,1],center=true);
}

module main() {
  //
  body();
  //
  head();
  //
}

//color("red") helpers();
main();
