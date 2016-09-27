// basic round
module basic_round_variation() {
  echo("######################################");
  echo("basic round - variations :");
  echo("* 'mark_I'     (0)   : basic one, just round");
  echo("* 'mark_II'    (1)   : like a round with a stud");
  echo("* 'mark_III'   (2)   : mini stud on top, big stud on bottom REWORK");
  echo("* 'mark_IV'    (3)   : just the big stud, on bottom REWORK");
  echo("* 'mark_V'     (4)   : big stud but on top REWORK");
  echo("* 'mark_VI'    (5)   : small stud on bottom REWORK");
  echo("* 'mark_VII'   (6)   : the 'mark_III' with a hole in the big stud REWORK");
  echo("* 'mark_VIII'  (7)   : invert of 'mark_III' REWORK");
  echo("* 'mark_IX'    (8)   : invert of 'mark_VII' REWORK");
  echo("* 'mark_X'     (9)   : double small_stud, on each side NOT READY");
  echo("* 'mark_XI'    (10)  : like 'mark_X', but with big stud NOT READY");
  echo("* 'mark_XII'   (11)  : the 'mark_XI' with holes NOT READY");
  echo("######################################");
}

module basic_round_show() {
  translate([0,0,0]) basic_round(variation="mark_I");
  translate([0,6,0]) basic_round(variation="mark_II");
  translate([0,12,0]) basic_round(variation="mark_III");
  translate([0,18,0]) basic_round(variation="mark_IV");
  translate([0,24,0]) basic_round(variation="mark_V");
  translate([6,0,0]) basic_round(variation="mark_VI");
  translate([6,6,0]) basic_round(variation="mark_VII");
  translate([6,12,0]) basic_round(variation="mark_VIII");
  translate([6,18,0]) basic_round(variation="mark_IX");
  translate([6,24,0]) basic_round(variation="mark_X");
  translate([12,0,0]) basic_round(variation="mark_XI");
  translate([12,6,0]) basic_round(variation="mark_XII");
}

module basic_round(size=1,det=1,variation="mark_I") {
  // INTERNAL MODULES ################################
  // #################################################
  module ring(h,i,o,$fn=12) {
    difference() {
      cylinder(h,d=o,center=true);
      cylinder((h+1),d=i,center=true);
    }
  }
  // #################################################
  det = 12*size*det;
  $fn = det;
  if (variation == "mark_I" || variation == 0) {
    cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
  }
  else if (variation == "mark_II" || variation == 1) {
    union() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*2.5-0.15]) cylinder(h=size*1.5+0.1,d=size*3-0.1,center=false,$fn=det);
    }
  }
  else if (variation == "mark_III" || variation == 2) { // REWORK
    union() {
      //
      cylinder(h=size*1.5+0.1,d=size*4-0.1,center=false,$fn=det);
      //
      translate([0,0,size*1.5]) cylinder(h=size-0.05,d=size*5-0.1,center=false,$fn=det);
      //
      translate([0,0,size*2.5-0.15]) cylinder(h=size*1.5+0.1,d=size*3-0.1,center=false,$fn=det);
      //
      //
      //translate([0,0,size*2]) ring(size,size*3-0.1,size*5,$fn=det);
      //translate([0,0,size*0.5-0.1]) ring(size+0.1,size*4-0.1,size*5,$fn=det);
    }
  }
  else if (variation == "mark_IV" || variation == 3) { // REWORK
    difference() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*0.5-0.1]) ring(size+0.1,size*4-0.1,size*5,$fn=det);
    }
  }
  else if (variation == "mark_V" || variation == 4) { // REWORK
    difference() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*2]) ring(size,size*4-0.1,size*5,$fn=det);
    }
  }
  else if (variation == "mark_VI" || variation == 5) { // REWORK
    difference() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*0.5-0.1]) ring(size+0.1,size*3-0.1,size*5,$fn=det);
    }
  }
  else if (variation == "mark_VII" || variation == 6) { // REWORK
    difference() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*2]) ring(size,size*3-0.1,size*5,$fn=det);
      translate([0,0,size*0.5-0.1]) ring(size+0.1,size*4-0.1,size*5,$fn=det);
      translate([0,0,-0.1]) cylinder(h=size+0.1,d=size*3,center=false,$fn=det);
    }
  }
  else if (variation == "mark_VIII" || variation == 7) { // REWORK
    difference() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*2]) ring(size,size*4-0.1,size*5,$fn=det);
      translate([0,0,size*0.5-0.1]) ring(size+0.1,size*3-0.1,size*5,$fn=det);
    }
  }
  else if (variation == "mark_IX" || variation == 8) { // REWORK
    difference() {
      cylinder(h=size*2.5-0.05,d=size*5-0.1,center=false,$fn=det);
      translate([0,0,size*2]) ring(size,size*4-0.1,size*5,$fn=det);
      translate([0,0,size*2]) cylinder(h=size,d=size*3,center=true,$fn=det);
      translate([0,0,size*0.5-0.1]) ring(size+0.1,size*3-0.1,size*5,$fn=det);
    }
  }
}
