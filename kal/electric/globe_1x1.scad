// globe 1x1

// external vars #########################

ext_scale = 1.0;
ext_fn = 12;

// part ##################################

module globe_1x1(m_scale=ext_scale,m_fn=ext_fn) {
    scale([m_scale,m_scale,m_scale])
    union() {
        pts_base = [[2,0],[0,-1],[0,2]];
        div = m_fn/3;
        pts_arc = [for (i=[1:div-1]) let (ang = 90-(90/div)*i) [cos(ang)*2,sin(ang)*2]];
        pts = concat(pts_base,pts_arc);
        translate([0,0,2.5]) rotate([0,0,180])
        rotate_extrude(angle=360,$fn=m_fn) polygon(pts);
        translate([0,0,0.5]) cylinder(h=2,d=4,center=false,$fn=m_fn);
        cylinder(h=1,d=3.5,center=false,$fn=m_fn);
    }
}

globe_1x1();
