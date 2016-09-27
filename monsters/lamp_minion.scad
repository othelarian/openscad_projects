// #####################################
// lamp_minion
// #####################################

// helpers #############################

module polyk(pts) { linear_extrude(height=1,center=true) polygon(pts); }

module side_helper() { translate([0,-35,30]) rotate([90,0,0]) cube([60,60,1],center=true); }
module back_helper() { translate([-35,0,30]) rotate([0,90,0]) cube([60,60,1],center=true); }
module helpers() { side_helper(); back_helper(); }

// cut preview #########################

module cut_preview() {
  //
  // body
  translate([0,0,40])
  cube([20,20,30],center=true);
  //
  // thigh right
  // thigh left
  // leg right
  // leg left
  // foot right
  translate([0,-10,2]) cube([10,10,4],center=true);
  // foot left
  translate([0,10,2]) cube([10,10,4],center=true);
  //
  //
}

// modules #############################

module body() {
  //
  //
}

// legs modules ##############

module hip() {
  //
  // IDEA : raquette
  //
}

module foot() {
  //
  //cube([
  //
}

module leg() {
  //
  foot();
  //
}

// assembly ############################

module assembly_lamp_minion() {
  union() {
    //
    //
  }
}

//launch time ! ########################

helpers();
cut_preview();
//assembly_lamp_minion();
