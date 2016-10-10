// plate 1x2

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module plate_1x2(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    translate([-2.5,-5,0])
    cube([5,10,2]);
}

plate_1x2();
