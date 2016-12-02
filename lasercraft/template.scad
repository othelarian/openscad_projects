// infos ###########################

//nb pieces : 1
//thickness : 2

// includes ########################

include <utils.scad>;

// variables #######################

ext_id = -1;
all = (ext_id < 0)? true : false;
$fn = 12;

// functions #######################

// composing #######################

if (tstid(1)) cube(10,center=true);
