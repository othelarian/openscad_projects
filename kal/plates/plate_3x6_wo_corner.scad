// plate 3x6 without corner

// external vars

ext_scale = 1.0;

// part

pts = [[-15,0],[-15,5],[-5,15],[5,15],[15,5],[15,0]];

scale([ext_scale,ext_scale,ext_scale])
linear_extrude(height=2,center=false)
polygon(pts);
