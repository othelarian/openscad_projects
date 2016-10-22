// plate 2x2 bow

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module plate_2x2_bow(m_scale,ext_scale,m_fn=ext_fn) {
    //
    pts_base = [[0,-5],[2,-5],[4,-2.5],[4,2.5],[2,5],[0,5]];

    r_big = (sqrt(34)/2)/(3/sqrt(34));
    r_big2 = r_big*r_big;
    u_big = r_big-3;
    pts_big = [
    [0,0],[0,4],
    [1.25,1+sqrt(r_big2-1.5625)-u_big],
    [2.5,1+sqrt(r_big2-6.25)-u_big],
    [3.75,1+sqrt(r_big2-14.0625)-u_big],
    [5,1],[5,0]
    ];

    r_side = (sqrt(31.25)/2)/(2.5/sqrt(31.25));
    r_side2 = r_side*r_side;
    u_side = r_side-2.5;
    pts_side = [
    [-1,-1],[0,2.5],
    [1.25,sqrt(r_side2-1.5625)-u_side],
    [2.5,sqrt(r_side2-6.25)-u_side],
    [3.75,sqrt(r_side2-14.0625)-u_side],
    [5,0]
    ];

    r_small = (sqrt(26)/2)/(1/sqrt(26));
    r_small2 = r_small*r_small;
    u_small = r_small-1;
    pts_small = [
    [0,0],[0,2],
    [1.25,1+sqrt(r_small2-1.5625)-u_small],
    [2.5,1+sqrt(r_small2-6.25)-u_small],
    [3.75,1+sqrt(r_small2-14.0625)-u_small],
    [5,1],[5,0]
    ];
    //
    scale([m_scale,m_scale,m_scale]) union() {
      rotate([0,-90,0]) linear_extrude(height=5) polygon(pts_base);
      translate([-2.5,-2.5,1]) cylinder(h=3,d=5,center=false,$fn=12);
      translate([-2.5,2.5,1]) cylinder(h=3,d=5,center=false,$fn=12);
      hull() {
        difference() {
          translate([0,5,0]) rotate([90,0,0]) linear_extrude(height=10) polygon(pts_big);
          translate([0,-5,-1]) linear_extrude(height=6) polygon(pts_side);
          translate([0,5,5]) rotate([180,0,0]) linear_extrude(height=6) polygon(pts_side);
        }
        translate([0,5,0]) rotate([90,0,0]) linear_extrude(height=10) polygon(pts_small);
    }
    }
}

plate_2x2_bow();
