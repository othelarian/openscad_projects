// brick 2x2

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module brick_2x2(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    translate([-5,-5,0])
    cube([10,10,6],center=false);
}

brick_2x2();
