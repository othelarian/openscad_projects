// plate round 2x2

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module plate_round_2x2(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    cylinder(h=2,d=10,center=false,$fn=m_fn);
}

plate_round_2x2();
