// arcs_fn.scad ########################

// internal functions ##################

// arc construction:
// - ang -> array[start angle, arc angle]
// - o (offset) -> array[width,height]
function arc_output(ang,r,n,o) = [
  for (i=[0:n])
  let (tmp = ang[0]-(ang[1]/n)*i)
  [cos(tmp)*r+o[0],sin(tmp)*r+o[1]]
];

// API #################################

// 2 points arc
function arc_3pts(pt1,pt2,n) =
  let (ang = "")
  //arc_output(ang,r,n,o)
  []
;

// 2 points arc starting xwith a 90° angle
function arc_2pts_right(pt1,pt2,n) =
  let (
    h = (pt1[0] < pt2[0])? pt1[1] - pt2[1] : pt2[0] - pt1[0],
    w = 0
  )
  //concat([pt1],arc_output(ang,r,n,o),[pt2])
  concat([pt1],[pt2])
;


// testing zone ########################

polygon(concat([[0,0]],arc_2pts_right([0,10],[20,0])));
