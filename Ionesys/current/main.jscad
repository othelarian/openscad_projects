// main.jscad (current folder)

// external vars ################################

// includes #####################################

include("utils.jscad");
include("current.jscad");

// internal vars ################################

var objs = [];
var outs = [];

// parameters ###################################

function getParameterDefinitions() {
  return [
    {name:"render",type:"checkbox",checked:true,caption:"Render objects : "},
    {name:"bones",type:"checkbox",checked:true,caption:"Render bones : "},
    {name:"helpers",type:"checkbox",checked:true,caption:"Render helpers : "}
  ];
}

// main #########################################

function main(args) {
  if (args.helpers) helpers();
  if (args.render) render();
  if (args.bones) bones();
  return outs.concat(utils_preproc());
}

