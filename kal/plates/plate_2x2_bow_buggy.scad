// plate 2x2 bow

// external vars #########################

ext_scale = 1.0;

// internal vars #########################

pts_base = [[0,-5],[2,-5],[4,-2.5],[4,2.5],[2,5],[0,5]];

base_r = (sqrt(26)/2)/(1/sqrt(26));
base_ang_z = base_r-1;
top_r = (sqrt(34)/2)/(3/sqrt(34));
top_ang_z = top_r-3;
side_r = (sqrt(25+2.5*2.5)/2)/(2.5/sqrt(25+2.5*2.5));
side_ang_z = side_r-2.5;

pts_bow = [
// base 0,1,2,3,4
[-5,0,0],[-5,5,0],[-5,5,2],[-5,2.5,4],[-5,0,4],
// bloc 5,6,7,8,9
[0,0,0],[0,5,0],[0,5,2],[0,2.5,4],[0,0,4]/*,
// first step 10,11,12,13,14
[1.25,0,0],[1.25,5,0],
[1.25,5,1+sqrt(base_r*base_r-1.25*1.25)-base_ang_z],
[1.25,2.5+side_r-sqrt(side_r*side_r-1.25*1.25),1+sqrt(top_r*top_r-1.25*1.25)-top_ang_z],
[1.25,0,1+sqrt(top_r*top_r-1.25*1.25)-top_ang_z],
// second step 15,16,17,18,19
[2.5,0,0],[2.5,5,0],
[2.5,5,1+sqrt(base_r*base_r-2.5*2.5)-base_ang_z],
[2.5,2.5+side_r-sqrt(side_r*side_r-2.5*2.5),1+sqrt(top_r*top_r-2.5*2.5)-top_ang_z],
[2.5,0,1+sqrt(top_r*top_r-2.5*2.5)-top_ang_z],
// third step 20,21,22,23,24
[3.75,0,0],[3.75,5,0],
[3.75,5,1+sqrt(base_r*base_r-3.75*3.75)-base_ang_z],
[3.75,2.5+side_r-sqrt(side_r*side_r-3.75*3.75),1+sqrt(top_r*top_r-3.75*3.75)-top_ang_z],
[3.75,0,1+sqrt(top_r*top_r-3.75*3.75)-top_ang_z],
// end 25,26,27,28
[5,0,0],[5,5,0],[5,5,1],[5,0,1]
*/
];

fc_bow = [
// base
[0,1,2,3,4],
//bloc
[0,1,6,5],
//[1,6,7,2],
//[2,7,8,3],
//[3,8,9,4],[0,4,9,5],
//
[5,9,8,7,6]
//
/*
//first step
[0,1,6,5],[1,2,7,6],
[2,3,8],[2,8,7],
[3,4,9,8],[0,4,9,5],
// second step
[5,6,11,10],[6,7,12,11],
[7,8,13],[7,13,12],
[8,9,14,13],[5,9,14,10],
// third step
[10,11,16,15],[11,12,17,16],
[12,13,18],[12,18,17],
[13,14,19,18],[10,14,19,15],
// last step
[15,16,21,20],[16,17,22,21],[17,18,22],[18,19,23,22],[15,19,23,20],
// end
[20,21,22,23]
*/
];

// part ##################################

scale([ext_scale,ext_scale,ext_scale])
union() {
  polyhedron(points=pts_bow,faces=fc_bow);
  //mirror([0,1,0]) polyhedron(points=pts_bow,faces=fc_bow);
  //rotate([0,-90,0]) linear_extrude(height=5) polygon(pts_base);
  //translate([-2.5,-2.5,1]) cylinder(h=3,d=5,center=false,$fn=12);
  translate([-2.5,2.5,1]) cylinder(h=3,d=5,center=false,$fn=12);
}
