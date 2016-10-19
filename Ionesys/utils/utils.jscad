// utils.jscad ##################################

// INTERNAL FUNCTIONS ###########################

// arc generation ###############################
function arc_gen_base(h,w) {
  var hyp_arc = sqrt(h*h+w*w);
  var r_arc = (hyp_arc/2) / (h/hyp_arc);
  var u_arc = r_arc - h;
  var ang_arc = (90-acos(h/hyp_arc))*2;
  return {hyp:hyp_arc,r:r_arc,u:u_arc,ang:ang_arc};
}

// EXTERNAL FUNCTIONS ########################### 

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
  var arc = arc_gen_base(h,w);
  var pts = [];
  for (var i=1;i<n;i++) {
    var tmp_ang = 90-(arc.ang/n)*i;
    pts.push([
      cos(tmp_ang)*arc.r-ow,
      sin(tmp_ang)*arc.r-arc.u-oh
    ]);
  }
  return pts;
};

// arc ##########################################
utils_arc = function(h,w,oh,ow,n) {
  var arc = arc_gen_base(h,w/2);
  arc.ang = arc.ang*2;
  var pts = [];
  for (var i=1;i<n;i++) {
    var tmp_ang = (90+arc.ang/2)-(arc.ang/n)*i;
    pts.push([
      cos(tmp_ang)*arc.r-ow,
      sin(tmp_ang)*arc.r-arc.u-oh
    ]);
  }
  return pts;
};

// half ovoid ###################################
utils_half_ovoid = function(br,sr,e,n) {
  if (!(n instanceof Array)) n = [n,n,n];
  var pts = [[-br,0]];
  // first arc
  for (var i=1;i<=n[0];i++) {
    var tmp_ang = 180-(90/n[0])*i;
    pts.push([cos(tmp_ang)*br,sin(tmp_ang)*br]);
  }
  // second arc
  var u_arc = (e*e-(br-sr)*(br-sr))/(2*(br-sr));
  var r_arc = u_arc+br;
  var ang_arc = atan(e/u_arc);
  for (var i=1;i<=n[1];i++) {
    var tmp_ang = 90-(ang_arc/n[1])*i;
    pts.push([cos(tmp_ang)*r_arc,sin(tmp_ang)*r_arc-u_arc]);
  }
  // third arc
  ang_arc = 90-ang_arc;
  for (var i=1;i<n[2];i++) {
    var tmp_ang = ang_arc-(ang_arc/n[2])*i;
    pts.push([cos(tmp_ang)*sr+e,sin(tmp_ang)*sr]);
  }
  pts.push([e+sr,0]);
  return pts;
};

// ovoid ########################################
utils_ovoid = function(br,sr,e,n) {
  if (!(n instanceof Array)) n = [n,n,n];
  var pts = [];
  // first arc
  for (var i=0;i<=n[0];i++) {
    var tmp_ang = 270-(180/n[0])*i;
    pts.push([cos(tmp_ang)*br,sin(tmp_ang)*br]);
  }
  // second arc
  var u_arc = (e*e-(br-sr)*(br-sr))/(2*(br-sr));
  var r_arc = u_arc+br;
  var ang_arc = atan(e/u_arc);
  for (var i=1;i<=n[1];i++) {
    var tmp_ang = 90-(ang_arc/n[1])*i;
    pts.push([cos(tmp_ang)*r_arc,sin(tmp_ang)*r_arc-u_arc]);
  }
  // third arc
  var thd_ang = 90-ang_arc;
  for (var i=1;i<=n[2];i++) {
    var tmp_ang = thd_ang-((thd_ang*2)/n[2])*i;
    pts.push([cos(tmp_ang)*sr+e,sin(tmp_ang)*sr]);
  }
  // fourth arc
  for (var i=1;i<n[1];i++) {
    var tmp_ang = -thd_ang-(ang_arc/n[1])*i;
    pts.push([cos(tmp_ang)*r_arc,sin(tmp_ang)*r_arc+u_arc]);
  }
  return pts;
};

// half ellipse #################################
utils_half_ellipse = function(br,sr,e,n) {
  if (!(n instanceof Array)) n = [n,n];
  var pts = [[-(sr+e),0]];
  var u_arc = (e*e-(br-sr)*(br-sr))/(2*(br-sr));
  var r_arc = u_arc+br;
  var ang_arc = atan(e/u_arc);
  var ang_ext = 90-ang_arc;
  // first arc
  for (var i=1;i<=n[0];i++) {
    var tmp_ang = 180-(ang_ext/n[0])*i;
    pts.push([cos(tmp_ang)*sr-e,sin(tmp_ang)*sr]);
  }
  // second arc
  for (var i=1;i<=n[1];i++) {
    var tmp_ang = 180-ang_ext-((ang_arc*2)/n[1])*i;
    pts.push([cos(tmp_ang)*r_arc,sin(tmp_ang)*r_arc-u_arc]);
  }
  // third arc
  for (var i=1;i<n[0];i++) {
    var tmp_ang = ang_ext-(ang_ext/n[0])*i;
    pts.push([cos(tmp_ang)*sr+e,sin(tmp_ang)*sr]);
  }
  pts.push([sr+e,0]);
  return pts;
};

// ellipse ######################################
utils_ellipse = function(br,sr,e,n) {
  if (!(n instanceof Array)) n = [n,n];
  var pts = [];
  var u_arc = (e*e-(br-sr)*(br-sr))/(2*(br-sr));
  var r_arc = u_arc+br;
  var ang_arc = atan(e/u_arc);
  var ang_ext = 90-ang_arc;
  // first arc
  for (var i=0;i<=n[0];i++) {
    var tmp_ang = (180+ang_ext)-((ang_ext*2)/n[0])*i;
    pts.push([cos(tmp_ang)*sr-e,sin(tmp_ang)*sr]);
  }
  // second arc
  for (var i=1;i<=n[1];i++) {
    var tmp_ang = 90+ang_arc-((ang_arc*2)/n[1])*i;
    pts.push([cos(tmp_ang)*r_arc,sin(tmp_ang)*r_arc-u_arc]);
  }
  // third arc
  for (var i=1;i<=n[0];i++) {
    var tmp_ang = ang_ext-((ang_ext*2)/n[0])*i;
    pts.push([cos(tmp_ang)*sr+e,sin(tmp_ang)*sr]);
  }
  // fourth arc
  for (var i=1;i<n[1];i++) {
    var tmp_ang = -ang_ext-((ang_arc*2)/n[1])*i;
    pts.push([cos(tmp_ang)*r_arc,sin(tmp_ang)*r_arc+u_arc]);
  }
  return pts;
};

