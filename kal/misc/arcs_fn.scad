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

function demi_arc(h,w,n,o=[0,0]) =
  let (hyp = sqrt(h*h+w*w),r = (hyp/2) / (h/hyp),ang = (90-acos(h/hyp))*2)
  [for (i=[0:n]) let (tmp = 90-(ang/n)*i) [cos(tmp)*r+o[0],sin(tmp)*r-(r-h)+o[1]]]
;

function arc(h,w,n,o=[0,0]) =
  let (hyp = sqrt(h*h+(w/2)*(w/2)),r = (hyp/2) / (h/hyp),ang = (90-acos(h/hyp))*4)
  [for (i=[0:n]) let (tmp = 90+(ang/2)-(ang/n)*i) [cos(tmp)*r+o[0],sin(tmp)*r-(r-h)+o[1]]]
;
