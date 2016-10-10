// plate 2x3

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module plate_2x3(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    translate([-5,-7.5,0])
    cube([10,15,2]);
}

plate_2x3();
