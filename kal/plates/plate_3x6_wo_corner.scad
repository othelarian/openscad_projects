// plate 3x6 without corner

// external vars #########################

// part ##################################

module plate_3x6_wo_corner() {
  pts = [[-15,0],[-15,5],[-5,15],[5,15],[15,5],[15,0]];
  linear_extrude(height=2,center=false) polygon(pts);
}

plate_3x6_wo_corner();
