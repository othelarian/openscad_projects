// brick 2x4

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module brick_2x4(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    translate([-5,-10,0])
    cube([10,20,6]);
}

brick_2x4();
