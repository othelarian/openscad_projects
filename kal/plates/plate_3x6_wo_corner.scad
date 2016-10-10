// plate 3x6 without corner

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module plate_3x6_wo_corner(m_scale=ext_scale,m_fn=ext_fn) {
    pts = [[-15,0],[-15,5],[-5,15],[5,15],[15,5],[15,0]];
    scale([m_scale,m_scale,m_scale])
    linear_extrude(height=2,center=false)
    polygon(pts);
}

plate_3x6_wo_corner();
