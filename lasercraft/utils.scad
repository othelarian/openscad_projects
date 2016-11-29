// utils functions #######################

// piece id tester #######################

function tstid(id) = (ext_id == -1 || ext_id == id)? true : false;

// polygon slice #########################

module slice(points,thickness) {
  linear_extrude(thickness) polygon(points);
}

// mirror path ###########################

function mirror_x(path) = concat(path,[for (i = [len(path)-1:-1:0]) [-1*path[i][0],path[i][1]]]);

function mirror_y(path) = concat(path,[for (i = [len(path)-1:-1:0]) [path[i][0],-1*path[i][1]]]);
