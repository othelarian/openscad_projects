// utils.jscad ##################################

// X,Y,Z empty indicator
utils_sat = function() {
  var sat_col = [0.2,0.2,0.2,0.4];
  var sat_args = {size:[5,0.4,0.4],center:[false,true,true]};
  var sat_x = cube(sat_args).setColor(sat_col);
  var sat_y = cube(sat_args).rotateZ(90).setColor(sat_col);
  var sat_z = cube(sat_args).rotateY(-90).setColor(sat_col);
  sat = sat_x.union(sat_y).union(sat_z);
  return sat;
};

// scale 2d and 3d shapes
utils_preproc = function() {
  pieces = [];
  for (var i=0;i<p2d.length;i++) pieces.push(p2d[i].scale(0.1));
  for (var i=0;i<p3d.length;i++) pieces.push(p3d[i].scale(0.1));
  return pieces;
};

