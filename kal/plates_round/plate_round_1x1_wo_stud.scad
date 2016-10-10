// plate round 1x1 wo stud

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module plate_round_1x1_wo_stud(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    union() {
        cylinder(h=2,d=4,center=false,$fn=m_fn);
        translate([0,0,1.5])
        cylinder(h=0.5,d=5,center=false,$fn=m_fn);
    }
}

plate_round_1x1_wo_stud();
