// main.jscad (current folder)

// external vars ################################

var ini_sat = {x: 0.0,y: 0.0,z: 0.0};

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
    {name:"sat",type:"group",caption:"SAT parameters :"},
    {name:"sat_enable",type:"checkbox",checked:true,caption:"Enable SAT : "},
    {name:"sat_x",type:"float",initial:ini_sat.x,caption:"SAT X pos : "},
    {name:"sat_y",type:"float",initial:ini_sat.y,caption:"SAT Y pos : "},
    {name:"sat_z",type:"float",initial:ini_sat.z,caption:"SAT Z pos : "}
  ];
}

// main #########################################

function main(args) {
  if (args.helpers) helpers();
  if (args.render) render();
  if (args.bones) bones();
  //
  // TODO : test arc
  //
  var pts = [[20,0],[0,0],[0,10]].concat(utils_half_arc(10,20,0,0,7));
  var a = polygon(pts);
  //
  p2d.push(a);
  //
  // TODO : test ovoid
  //
  var pieces = (args.preproc)? utils_preproc() : p2d.concat(p3d);
  if (args.sat_enable) pieces.push(utils_sat().translate([args.sat_x,args.sat_y,args.sat_z]));
  return pieces;
}

