// brick 1x1 4 side stud w holes

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module brick_1x1_4_side_stud_w_holes(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    difference() {
        union() {
            translate([-2.5,-2.5,0]) cube([5,5,6],center=false);
            for (i = [0:3]) {
                rotate([0,0,90*i]) translate([0,2,3.5])
                rotate([-90,0,0]) cylinder(h=1.5,d=3,center=false,$fn=m_fn);
            }
        }
        translate([-4,0,3.5]) rotate([0,90,0])
        cylinder(h=8,d=2,center=false,$fn=m_fn);
        translate([0,4,3.5]) rotate([90,0,0])
        cylinder(h=8,d=2,center=false,$fn=m_fn);
    }
}

brick_1x1_4_side_stud_w_holes();
