// main.jscad (current folder)

// external vars ################################

// includes #####################################

include("utils.jscad");
include("current.jscad");

// internal vars ################################

var p2d = [];
var p3d = [];

// parameters ###################################

function getParameterDefinitions() {
  return [
    {name:"render",type:"checkbox",checked:true,caption:"Render objects : "},
    {name:"bones",type:"checkbox",checked:false,caption:"Render bones : "},
    {name:"helpers",type:"checkbox",checked:false,caption:"Render helpers : "},
    {name:"preproc",type:"checkbox",checked:true,caption:"Preprocess scale : "},
  ];
}

// main #########################################

function main(args) {
  if (args.helpers) helpers();
  if (args.render) render();
  if (args.bones) bones();
  var pieces = (args.preproc)? utils_preproc() : p2d.concat(p3d);
  //if (args.sat_enable) pieces.push(utils_sat().translate([args.sat_x,args.sat_y,args.sat_z]));
  return pieces;
}

