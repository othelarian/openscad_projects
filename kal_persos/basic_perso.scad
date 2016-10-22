// ovoid_prso.scad #####################

// uses & includes #####################

function arc(h,w,n) = [
  for (i=[0:n])
  let (
    hyp = sqrt(h*h+w*w),r = (hyp/2) / (h/hyp),
    ang = 90-(((90-acos(5/hyp))*2)/n)*i
  )
  [cos(ang)*r,sin(ang)*r-(r-h)]
];

// internal modules ####################

module body() {
  //top
  bow = concat([[0,0]],arc(30,30,5));
  //
  polygon(bow);
  //
}

// outputs #############################

module main() {
  union() {
    body();
    //
  }
}

main();
