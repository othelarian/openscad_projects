// utils functions #######################

// piece id tester #######################

function tstid(id) = (ext_id == -1 || ext_id == id)? true : false;

// polygon slice #########################

module slice(points,thickness) {
  translate([0,0,-1]) linear_extrude(thickness) polygon(points);
}

// mirror path ###########################

function mirror_x(path) = concat(path,[for (i = [len(path)-1:-1:0]) [-1*path[i][0],path[i][1]]]);

function mirror_y(path) = concat(path,[for (i = [len(path)-1:-1:0]) [path[i][0],-1*path[i][1]]]);

function mirror_xy(path) = mirror_x(mirror_y(path));

function mirror_yx(path) = mirror_y(mirror_x(path));

// math functions ########################

// distance between 2 vectors
function dist_2v(v1,v2) = let (x = v2[0]-v1[0],y = v2[1]-v1[1]) sqrt(x*x+y*y);

// angle of a segment
function ang_2v(v1,v2) = let (x = v2[0]-v1[0],y = v2[1]-v1[1]) atan(y/x);

// arc functions #########################

// arc from 2 points and 1 height
function arc_2p1h(p1,p2,h,n) =
  let (
    ah = abs(h),
    w = dist_2v(p1,p2)/2,hyp = sqrt(ah*ah+w*w),r = (hyp/2)/(ah/hyp),
    //ang = acos(h/hyp)*4,
    //
    dev_ang = (abs(ang_2v(p1,p2))+((p1[0]>p2[0])? 90 : 0))*((p1[1]>p2[1])? -1 : 1),
    sh = (h/abs(h))*((ah<w)? -1 : 1)*sqrt(r*r-w*w),
    //(h/abs(h))
    m = [(p2[0]-p1[0])/2+p1[0],(p2[1]-p1[1])/2+p1[1]],
    c = [cos(dev_ang+90)*sh+m[0],sin(dev_ang+90)*sh+m[1]],
    //
    start_ang = 180+((sh >= 0)? 1 : -1)*abs(acos(w/r))+dev_ang,
    end_ang = ((sh >= 0)? -1 : 1)*abs(acos(w/r))+dev_ang,
    //
    ang = abs(end_ang-start_ang)
    //
  )
  concat(
    [p1],//[c],[[w,sh]],//[[dev_ang,ang]],[[start_ang,end_ang]],//[[ang_2v(p1,c),0]],
    //
    [for (i=[1:n-1]) let (tmp = start_ang-(h/abs(h))*(ang/n)*i) [cos(tmp)*r+c[0],sin(tmp)*r+c[1]]],
    //[for (i=[1:n-1]) let (tmp = start_ang+10*i) [cos(tmp)*r+c[0],sin(tmp)*r+c[1]]],
    //
    [p2]
  );

// half arc from 2 points
function arc_h2p(p1,p2,n) =
  let ()
  concat(
    [p1],
    //
    //
    [p2]
  );

// ortho demi arc
function demi_arc(h,w,n,o=[0,0]) =
  let (hyp = sqrt(h*h+w*w),r = (hyp/2) / (h/hyp),ang = (90-acos(h/hyp))*2)
  concat(
    [[o[0],h+o[1]]],
    [for (i=[1:n-1]) let (tmp = 90-(ang/n)*i) [cos(tmp)*r+o[0],sin(tmp)*r-(r-h)+o[1]]],
    [[w+o[0],o[1]]]
  );

// ortho arc
function arc(h,w,n,o=[0,0]) =
  let (hyp = sqrt(h*h+(w/2)*(w/2)),r = (hyp/2) / (h/hyp),ang = (90-acos(h/hyp))*4)
  concat(
    [[-(w/2)+o[0],o[1]]],
    [for (i=[1:n-1]) let (tmp = 90+(ang/2)-(ang/n)*i) [cos(tmp)*r+o[0],sin(tmp)*r-(r-h)+o[1]]],
    [[w/2+o[0],o[1]]]
  );

// TEST ZONE ########

translate([5,10,0]) color("yellow") cube([1,1,1],center=true);
translate([10,5,0]) color("yellow") cube([1,1,1],center=true);
translate([7.5,7.5,0]) color("pink") cube([1,1,1],center=true);
translate([14.6,14.6,0]) color("turquoise") cube([1,1,1],center=true);
translate([0.4,0.4,0]) color("turquoise") cube([1,1,1],center=true);
translate([4.4,4.4,0.5]) color("blue") cube([1,1,1],center=true);
translate([10.5,10.5,0.5]) color("blue") cube([1,1,1],center=true);
//translate([9.8,9.8,0.5]) color("blue") cube([1,1,1],center=true);

pts = arc_2p1h([5,10],[10,5],-10,5);
echo(pts);
polygon(pts);
