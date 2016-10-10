// brick 1x8

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################`

module brick_1x8(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    translate([-2.5,-20,0])
    cube([5,40,6],center=false);
}

brick_1x8();
