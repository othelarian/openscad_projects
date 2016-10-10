// brick round 1x1 w hole

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module brick_round_1x1_w_hole(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    difference() {
        union() {
            cylinder(h=2,d=4,center=false,$fn=m_fn);
            translate([0,0,1.5])
            cylinder(h=4.5,d=5,center=false,$fn=m_fn);
            translate([0,0,5.5])
            cylinder(h=1.5,d=3,center=false,$fn=m_fn);
        }
        translate([0,0,-0.5])
        cylinder(h=8,d=2,center=false,$fn=m_fn);
    }
}

brick_round_1x1_w_hole();
