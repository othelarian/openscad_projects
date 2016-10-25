// basic_perso.scad ####################

// uses & includes #####################

use <../kal/misc/arcs_fn.scad>;

// internal vars #######################

$fn = 12;

// internal functions ##################

// internal modules ####################

module hip_shoulder_joint() {
  //internal vars
  $fn = 8;
  //internal modules
  module support() {
    translate([3,0,0]) union() {
      translate([0,10,0]) rotate([0,90,0]) cylinder(h=2,d=6);
      translate([0,4,3]) rotate([0,90,0]) cube([6,6,2]);
    }
  }
  //outputs
  union() {
    support(); mirror([1,0,0]) support();
    translate([0,10,0]) rotate([0,90,0]) cylinder(h=12,d=4,center=true);
    difference() {
      union() {
        translate([0,10,0]) rotate([0,90,0]) cylinder(h=5,d=8,center=true);
        translate([-2.5,10,-4]) cube([5,4,8]);
      }
      translate([0,10,0]) rotate([0,90,0]) cylinder(h=5.5,d=4.5,center=true);
    }
  }
}

module head() {
  //internal vars
  d = 38;
  e = 8;
  ee = 7;
  //internal moduless
  module eye() {
    $fn = 8;
    union() {
      difference() {
        translate([0,0,0]) rotate([0,-90,0])
        cylinder(h=8,d1=e-1,d2=e);
        translate([1,0,0]) rotate([0,-90,0])
        cylinder(h=2,d=e-2);
      }
      translate([-1,0,0])
      rotate([0,90,0])
      rotate_extrude(angle=360)
      polygon(concat([[0,-1]],demi_arc(2,(e-2)/2,3)));
    }
  }
  //outputs
  translate([2,0,122]) union() {
    rotate_extrude(angle=360) polygon(concat([[0,0]],demi_arc(d/2-2,d/2,4)));
    translate([0,0,-3]) cylinder(h=3,d1=d-4,d2=d);
    translate([18,0,5]) {
      translate([0,ee,0]) rotate([0,0,10]) eye();
      translate([0,-ee,0]) rotate([0,0,-10]) eye();
    }
  }
}

module body() {
  //internal vars
  d = 50;
  sh_e = 20;
  hp_e = 13;
  //internal modules
  module shoulder() {
    rotate_extrude(angle=360)
    translate([8,0,0]) polygon(concat([[0,0]],demi_arc(10,6,3)));
  }
  module hip() {
    translate([0,hp_e,0]) rotate([-90,0,0])
    union() {
      rotate_extrude(angle=360)
      translate([8,0,0]) polygon(concat([[0,0]],demi_arc(6,4,3)));
      translate([0,-6,-10]) hull() {
        cylinder(h=1,d=28);
        translate([0,6,9]) cylinder(h=2,d=26);
      }
    }
  }
  //outputs
  translate([0,0,120]) union() {
    difference() {
      union() {
        difference () {
          rotate_extrude(angle=360) polygon(concat([[0,0]],demi_arc(20,d/2,5)));
          translate([15,0,0]) rotate([90,0,180])
          linear_extrude(height=60,center=true) polygon([[-20,0],[-20,21],[60,20],[0,0],[0,-1]]);
        }
        translate([0,0,-8]) cylinder(h=8,d1=d+4,d2=d);
        translate([0,0,-20]) cylinder(h=12,d=d+4);
        translate([0,0,-32]) cylinder(h=12,d1=d,d2=d+4);
        translate([0,0,-42]) cylinder(h=10,d1=d-6,d2=d);
        translate([0,0,-46]) cylinder(h=4,d=d-16);
        translate([0,0,-48]) rotate([-90,0,0])
        cylinder(h=9,d1=d-6,d2=d-10);
        translate([0,0,-48]) rotate([90,0,0])
        cylinder(h=9,d1=d-6,d2=d-10);
      }
      translate([2,0,-4])
      rotate_extrude(angle=360)
      polygon([[0,0],[36/2,0],[40/2,4],[40/2,20],[0,20]]);
      //shoulders negative
      translate([0,sh_e+4,-16]) rotate([-90,0,0])
      cylinder(h=6,r=10);
      translate([0,-sh_e-4,-16]) rotate([90,0,0])
      cylinder(h=6,r=10);
    }
    //shoulders
    translate([0,0,-16]) {
      translate([0,sh_e,0]) rotate([-90,0,0]) shoulder();
      translate([0,-sh_e,0]) rotate([90,0,0]) shoulder();
    }
    //hips
    translate([0,0,-55]) { hip(); mirror([0,1,0]) hip(); }
  }
}

module shoulder() {
  //outputs
  translate([0,25,104]) union() {
    rotate([-90,0,0]) cylinder(h=4,d=15);
    hip_shoulder_joint();
    //
    translate([0,20,10])
    rotate([0,0,0])
    cylinder(h=4,d=10);
    //
    //
  }
}

module hand() {
  //
  //
}

module leg() {
  //outputs
  translate([0,15,65]) union() {
    //hip
    rotate([-90,0,0]) cylinder(h=3,d=15);
    translate([0,-2,0]) rotate([0,90,0]) hip_shoulder_joint();
    translate([0,12,0]) rotate([-90,0,0]) cylinder(h=2,d=12);
    translate([0,13,0]) rotate([-90,0,0]) cylinder(h=5,d=6,$fn=8);
    translate([0,12,0]) difference() {
      union() {
        rotate([-90,0,0]) cylinder(h=4,d=18);
        translate([0,4,0]) rotate([-90,0,0]) cylinder(h=2,d1=18,d2=14);
      }
      translate([0,-1,0]) rotate([-90,0,0]) cylinder(h=3.5,d=13);
      translate([0,2,0]) rotate([-90,0,0]) cylinder(h=7,d=6.5,$fn=8);
    }
    //thigh
    translate([0,12,-13]) {
      $fn = 8;
      difference() {
        cylinder(h=6,d=10);
        translate([0,0,-0.5]) cylinder(h=3,d=6.5);
      }
      translate([0,0,-14]) cylinder(h=16,d=6);
    }
    //knee
    translate([0,12,-30]) difference() {
      rotate([90,0,0]) cylinder(h=6,d=10,center=true);
      rotate([90,0,0]) cylinder(h=6.5,d=4.5,$fn=8,center=true);
    }
    translate([0,12,-30]) rotate([90,0,0]) cylinder(h=16,d=4,$fn=8,center=true);
    translate([0,8,-30]) rotate([90,0,0]) cylinder(h=3,d=10);
    translate([0,16,-30]) rotate([-90,0,0]) cylinder(h=3,d=10);
    translate([0,6,-52]) cylinder(h=19,d=4,$fn=8);
    translate([0,18,-52]) cylinder(h=19,d=4,$fn=8);
    //ankle
    translate([3,12,-48]) rotate([-90,0,90]) difference() {
      linear_extrude(height=6)
      polygon([[-7,0],[-7,6],[-6,9],[-5,9],[-4,8],[4,8],[5,9],[6,9],[7,6],[7,0]]);
      translate([0,7,3]) {
        rotate([90,0,0])
        rotate_extrude(angle=360) polygon(concat([[0,-1]],demi_arc(5.3,5.3,3)));
        rotate([-90,0,0])
        rotate_extrude(angle=360) polygon(concat([[0,-1]],demi_arc(5.3,5.3,3)));
      }
    }
    //
  }
}

module foot() {
  //internal modules
  module support_toe () {
    difference() {
      union() {
        translate([12,3.5,3]) rotate([90,0,0]) cylinder(h=2,d=6,$fn=8,center=true);
        translate([12,2.5,0]) rotate([90,0,180])
        linear_extrude(height=2) polygon([[0,0],[0,6],[4,6],[6,4],[7,1],[5,0]]);
      }
      translate([12,3.5,3]) rotate([90,0,0]) cylinder(h=3.5,d=3.3,$fn=8,center=true);
    }
  }
  module side_toe() {
    union() {
      support_toe(); mirror([0,1,0]) support_toe();
      translate([12,-2,0]) cube([5,4,6]);
      translate([12,-2,3]) rotate([-90,0,0]) cylinder(h=4,d=6,$fn=8);
      translate([12,0,3]) rotate([90,0,0]) cylinder(h=10,d=3,$fn=8,center=true);
      translate([16,0,0]) rotate([90,0,90]) hull() {
        linear_extrude(height=1) polygon([[-5,0],[-5,4],[-3,6],[3,6],[5,4],[5,0]]);
        translate([0,0,5])
        linear_extrude(height=1) polygon([[-3,0],[-3,2],[-2,3],[2,3],[3,2],[3,0]]);
      }
    }
  }
  //outputs
  translate([0,27,0]) union() {
    //base
    translate([0,0,1]) {
      rotate([0,0,-90]) linear_extrude(height=3)
      polygon([[-8,-5],[-8,5],[-5,8],[5,8],[8,5],[8,-5]]);
      translate([-5,0,0]) linear_extrude(height=3) {
        rotate([0,0,90]) polygon(concat([[0,0]],demi_arc(3,8,2)));
        rotate([0,180,90]) polygon(concat([[0,0]],demi_arc(3,8,2)));
      }
    }
    //toe center
    translate([16,0,0]) rotate([90,0,90]) hull() {
      linear_extrude(height=2) polygon([[-6,0],[-6,5],[-4,7],[4,7],[6,5],[6,0]]);
      translate([0,0,8])
      linear_extrude(height=1) polygon([[-4,0],[-4,3],[-3,4],[3,4],[4,3],[4,0]]);
    }
    translate([12,-2,0]) cube([5,4,6]);
    translate([12,-2,3]) rotate([-90,0,0]) cylinder(h=4,d=6,$fn=8);
    translate([12,0,3]) rotate([90,0,0]) cylinder(h=10,d=3,$fn=8,center=true);
    support_toe(); mirror([0,1,0]) support_toe();
    //toes side
    //rotate([0,0,90]) side_toe();
    //rotate([0,0,-90]) side_toe();
    //ankle
    translate([0,0,3]) cylinder(h=5,d=5,$fn=6);
    translate([0,0,10]) {
      rotate_extrude(angle=360) polygon(concat([[0,-1]],demi_arc(5,5,3)));
      rotate([180,0,0])
      rotate_extrude(angle=360) polygon(concat([[0,-1]],demi_arc(5,5,3)));
    }
  }
}

// outputs #############################

module helpers() {
  translate([-60,0,70]) rotate([0,90,0]) cube([140,100,1],center=true);
  translate([0,-60,70]) rotate([90,0,0]) cube([100,140,1],center=true);
  translate([0,0,-10]) cube([100,100,1],center=true);
}

module main() {
  union() {
    //body();
    head();
    shoulder(); mirror([0,1,0]) shoulder();
    hand(); mirror([0,1,0]) hand();
    leg(); mirror([0,1,0]) leg();
    foot(); mirror([0,1,0]) foot();
    //
    difference() {
      body();
      translate([0,10,90])
      cube(20);
    }
    //
  }
}

//color("red") helpers();
main();
