// basic plate

// IDEAS ####
// with or without angles
// limit size for some angles
// 
// ##########

module basic_plate_variation() {
  echo("######################################");
  echo("basic plate - variations :");
  echo("* 'mark_I'     (0)   : the most basic, choose the dim NOT READY");
  echo("* 'mark_II'    (1)   : with a hole in, for big stud NOT READY");
  echo("* 'mark_III'   (2)   : with a groove on bottom NOT READY");
  echo("* 'mark_IV'    (3)   : with a groove on top NOT READY");
  echo("* 'mark_V'     (4)   : 'mark_II' + 'mark_III' NOT READY");
  echo("* 'mark_VI'    (5)   : 'mark_II' + 'mark_IV' NOT READY");
  echo("######################################");
}

module basic_plate_show() {
  translate([0,0,0]) basic_plate(variation="mark_I");
  //
  //
}

module basic_plate(h=1,l=1,d=1,det=1,variation="mark_I") {
  // INTERNAL MODULES ################################
  // #################################################
  // #################################################
  det = 12*size*det;
  $fn=det;
  if (variation == "mark_I" || variation == 0) {
    //
    //translate([0,0,size*1.25]) cube();
    //
  }
}