// utils.jscad ##################################

// X,Y,Z empty indicator ########################
utils_sat = function() {
  var sat_col = [0.2,0.2,0.2,0.4];
  var sat_args = {size:[5,0.4,0.4],center:[false,true,true]};
  var sat_x = cube(sat_args).setColor(sat_col);
  var sat_y = cube(sat_args).rotateZ(90).setColor(sat_col);
  var sat_z = cube(sat_args).rotateY(-90).setColor(sat_col);
  sat = sat_x.union(sat_y).union(sat_z);
  return sat;
};

// scale 2d and 3d shapes #######################
utils_preproc = function() {
  pieces = [];
  for (var i=0;i<objs.length;i++) pieces.push(objs[i].scale(0.1));
  return pieces;
};

// half arc #####################################
utils_half_arc = function(h,w,oh,ow,n) {
  var hyp_arc = sqrt(h*h+w*w);
  var r_arc = (hyp_arc/2) / (h/hyp_arc);
  var u_arc = r_arc - h;
  var ang_arc = (90-acos(h/hyp_arc))*2;
  var pts = [];
  for (var i=1;i<n;i++) {
    var tmp_ang = 90-(ang_arc/n)*i;
    pts.push([
      cos(tmp_ang)*r_arc-ow,
      sin(tmp_ang)*r_arc-u_arc-oh
    ]);
  }
  return pts;
};

// arc ##########################################
utils_arc = function(h,w,oh,ow,n) {
  var hyp_arc = sqrt(h*h+(w/2)*(w/2));
  var r_arc = (hyp_arc/2) / (h/hyp_arc);
  var u_arc = r_arc - h;
  var ang_arc = (90-acos(h/hyp_arc))*4;
  var pts = [];
  for (var i=1;i<n;i++) {
    var tmp_ang = (90+ang_arc/2)-(ang_arc/n)*i;
    pts.push([
      cos(tmp_ang)*r_arc-ow,
      sin(tmp_ang)*r_arc-u_arc-oh
    ]);
  }
  return pts;
};

// half ovoid ###################################

utils_half_ovoid = function(br,sr,e,n) {
  if (!(n instanceof Array)) n = [n,n,n];
  //
  var pts = [];
  //
  // first arc
  for (var i=0;i<=n[0];i++) {
    var tmp_ang = 180-(90/n)*i;
    pts.push([cos(tmp_ang)*br,sin(tmp_ang)*br]);
  }
  // second arc
  //
  // third arc
  //
  //
  return pts;
};

// ovoid ########################################
utils_ovoid = function() {
  //
  //
};

// half ellipse #################################

// ellipse ######################################

